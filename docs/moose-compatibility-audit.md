# SQL model compatibility with Moose and Roassal

Audit date: 2026-09-20. Repository: `deem0n/FAMIXNGSQL`, master at
`6e1c636943796e1abba5c4a92b6e7270a6e2b00f`.

The SQL model works with generic inspection and several standard visualizations,
but it is not yet compatible with every installed Moose analysis. The most
important problems are recursive dependency traversal, non-unique entity names,
and incomplete source-anchor protocols. Some browsers also assume an object-oriented
model even though their acceptance checks admit SQL entities.

## Environment and scope

- Running Pharo 13.1.0 snapshot / Moose 13 image, accessed through Genie.
- Existing PostgreSQL model `mi`: 70,144 entities, 53 concrete SQL entity classes
  represented, 49 namespaces including catalog namespaces; language PostgreSQL.
- Inventoried all 28 installed concrete subclasses of `MiAbstractBrowser`.
- Exercised 509 supported core operations across one representative of each of
  the 53 entity classes, in addition to the initial 143-operation targeted pass.
- Checked applicable Famix visualizations and built three new Roassal 3 examples.
- Used isolated models for destructive-analysis entry points such as duplication,
  and Smalltalk/Java controls where useful. The live model was not reimported.
- The final entity count and identity set match the pre-audit model. No production
  methods were changed, no image was saved, and nothing was committed or pushed.

This is an audit of the installed image, not every Moose plugin or every possible
UI interaction. The image already contains earlier namespace-hierarchy and Fame
inspection fixes, as well as previous SQL migration work. A successful browser
open is only an entry-point smoke test unless deeper validation is stated below.
No full-model performance or parser-completeness claim is made.

Local evidence is in the ignored `artifacts/` directory:

- `moose-tool-inventory.json`: browser classes, packages and acceptance/follow methods.
- `moose-compatibility-results.json`: individual probes, observations and failure stacks.
- `audit-sql-roassal.st`: executable examples; three corresponding PNG exports.
- `audit-moose-reproducers.st`: isolated, read-only diagnostic reproductions.

Probe `pass` means the observation completed, not that the observed behavior is
correct. For example, a rejected input, an empty visualization and a wrong
dead-code classification can all be successfully recorded observations. One early
Bus Log construction failure was a harness setup error: the correct bus/application
factory subsequently opened successfully. It is not classified as a product bug.

## Confirmed problems and proposed fixes

### 1. Recursive navigation assumes all child relations are collections

**Priority: high. Owner: Famix / MooseQuery.**

`MQNavigationQuery>>queryFor:` passes each child property to
`OrderedCollection withAll:`. A SQL view's `sqlQuery` is a single entity, so the
query raises `Error: Instances of FmxSQLSelectQuery are not indexable`.

The broad 509-operation pass had 16 failures: `queryAllIncoming`,
`queryAllOutgoing`, `allClients` and `allProviders` on each sampled view, derived
table, namespace and SELECT query. Enclosing entities fail when traversal reaches
a nested scalar query relation. A simple SQL table can therefore work while a
view or an enclosing schema fails.

Reproducer, independent of the database:

```smalltalk
| model view query |
model := FmxSQLModel new.
query := FmxSQLSelectQuery new mooseModel: model; yourself.
view := FmxSQLView new
    name: 'audit_view'; sqlQuery: query; mooseModel: model; yourself.
view queryAllOutgoing. "Currently raises the not-indexable error"
```

Confirmed consumers: view-based DSM, view-based Butterfly, and the CoUsage provider
extractor. Query-browser recursive operations share this path even though opening
the query browser succeeds. The architectural map uses different/local navigation
paths and can still render.

**Fix:** make upstream traversal respect relation cardinality, preferably using the
existing scalar-aware `containedEntitiesDo:` protocol. Retain SQL's legitimate
one-to-one `sqlQuery` relation. Add scalar/many-valued containment regression cases
and check shared containment for duplicate work or cycles before generalizing the
implementation. Changing `sqlQuery` back to `query` would reintroduce the earlier
Moose query API collision and would not fix this problem.

### 2. SQL names violate the Moose uniqueness contract

**Priority: high. Owner: FAMIXNGSQL.**

SQL named entities inherit `mooseNameOn:` that writes only `name`, while
`hasUniqueMooseNameInModel` returns true. Tables with the same name in different
schemas therefore have identical Moose names. Java and Smalltalk class naming
implementations include their containers.

An isolated model with `audit_one.same_table` and `audit_two.same_table` produces
`same_table` for both entities. `model entityNamed: 'same_table'` returns the first
one, and lookup using either qualified name returns nil. This is a name-lookup
ambiguity; entity identities remain distinct.

Observed collisions among nonstub entities in `mi`:

| Entity type | Entities | Colliding name groups | Entities in those groups |
| --- | ---: | ---: | ---: |
| Table | 359 | 56 | 218 |
| View | 85 | 14 | 57 |
| Column | 4,221 | 395 | 3,925 |
| Stored procedure | 2,321 | 342 | 1,174 |
| Trigger stored procedure | 140 | 1 | 2 |
| Trigger | 569 | 60 | 256 |

**Fix:** define stable SQL-qualified Moose names. Include schemas for relations,
relation/routine owners for contained names, and input type signatures for
overloaded routines. Define quoting/escaping rules for PostgreSQL identifiers and
invalidate cached names when their components change. Test lookup across schemas,
overloads, quoted identifiers, reparenting and MSE round trips. For entities without
a meaningful unique name, use an honest uniqueness contract rather than claiming
that a short display label is globally unique.

The Roassal examples qualify labels explicitly as a presentation workaround; they
do not change model naming or lookup behavior.

### 3. SQL source anchors leave required methods unimplemented

**Priority: high. Owner: FAMIXNGSQL.**

`FmxSQLEntitySourceAnchor` inherits explicit requirements for `knowsStart`,
`knowsEnd` and `hasSource`. All three raise `Error: Explicitly required method`.
This was the only represented SQL class with unresolved explicit trait requirements
in the static method scan.

The Duplication browser accepts anchored SQL query entities, but its detector
calls `knowsStart`/`knowsEnd` during input filtering. Running duplication on two
isolated SQL query fixtures reproduced the failure, without modifying `mi`.

**Fix:** implement the full anchor protocol with accurate bounds semantics, using
the existing owner-source/start/end representation. Test valid, missing, partial
and out-of-range anchors. Then exercise the detector and fragment display further;
passing the first bounds checks alone will not prove complete duplication support.

### 4. Source Text browser cannot adapt SQL sources

**Priority: high. Owner: SQL/MooseIDE integration.**

`MiSourceTextBrowser` accepts routines and views because they use
`FamixTSourceEntity`, then fails with `No source anchor adpater found` while building
highlights. The installed adapters recognize Smalltalk entities or indexed-file
anchors. SQL stores full definitions and source intervals inside model entities.

Full source text is present: all 85 views expose their stored definition through
`sourceText`. However, none of those views has a conventional `sourceAnchor`.
Of 5,556 exact stored-procedure entities including stubs, only 9 have an anchor;
all 1,481 SELECT query entities have an entity source anchor.

**Fix:** add an adapter for immediate/owner-backed source text, with correct
highlight offsets and a plain-text fallback when ranges are unavailable. Keep
MooseIDE-specific integration in a suitable optional package. Do not fabricate
filesystem anchors for definitions read from PostgreSQL.

### 5. Default analyses have object-oriented semantics

**Priority: medium, high if used to make removal decisions. Owners: SQL integration
and MooseIDE/Famix analysis packages.**

- **CoUsage:** the default attribute-access extractor sends `#accesses` to SQL
  tables, which do not implement it. `MiCoUsageMapModel>>allAttributesFor:` catches
  the error and returns an empty collection. The actual browser showed three
  container boxes and zero inner boxes. Add a SQL extractor for table/column or
  routine/reference co-usage, with explicit applicability and visible failures.
- **Dead Code:** the default rule checks only `incomingInvocations isEmpty`.
  Full analysis on an isolated routine bound to a trigger classified it as dead.
  Trigger bindings, external entry points, scheduled calls and unresolved/dynamic
  SQL need explicit treatment. Such results should be candidates requiring review,
  not proof that database routines are unused.
- **Duplication cleaner:** the default is `FamixRepCLikeCleaner`. A probe retained
  `-- SQL comment` but truncated `SELECT 'https://example.test';` to
  `SELECT'https:`. Add SQL-aware token/string/comment handling; changing the
  source-anchor protocol alone will not make comparison meaningful.
- **Layer Visualization:** accepts the model, but
  `MiLayerVisualizationModel findModelApplicableTo:` returns nil. Add a SQL layer
  strategy or reject the model with an explicit explanation.

### 6. Model Report divides by zero on a non-OO model

**Priority: medium. Owner: MooseIDE-Core-Reporter.**

`MiModelReportModel>>sectionPackages` divides the count of OO classes by the count
of OO packages. Both are zero in this SQL model. Opening the accepted model raises
`ZeroDivide`.

**Fix:** handle empty denominators and make report sections conditional on supported
model capabilities. Add SQL sections for schemas, relations, routines, triggers,
constraints, dependency coverage and analysis diagnostics. SQL schemas should not
be represented as OO packages solely to satisfy this calculation.

### 7. Meta Browser overwrites a framework property dictionary

**Priority: medium. Owner: MooseIDE-Meta. Not SQL-specific.**

`MiMetaBrowser>>initializeProperties` assigns a notebook presenter to the inherited
`properties` slot. `SpPresenter>>hasInitialPosition` subsequently sends `keys` to
that notebook. Opening fails with `SpNotebookPresenter did not understand #keys`.
A fresh `FamixStModel` reproduced the same failure.

**Fix:** give the notebook its own distinctly named instance variable and update
the browser's references, preserving the presenter's property dictionary. Cover
normal window construction as well as SQL and Smalltalk model reception.

### 8. Name Cloud has missing class-side helpers

**Priority: medium. Owner: Famix-Visualizations. Not SQL-specific.**

`MooseGroupNameCloud>>entityAndItsKeywords:` sends `self class separators`, which
does not exist in this image. Both SQL tables and a synthetic Smalltalk class fail
with `MooseGroupNameCloud class did not understand #separators`.

**Fix:** restore the tokenizer configuration expected by the visualization and test
the complete keyword pipeline, including stop-word handling. SQL-specific name
tokenization can be added after the generic failure is fixed.

### 9. Legacy SQL visualization packages are still unported

**Priority: medium if these optional packages are to be supported. Owner: FAMIXNGSQL.**

The core baseline intentionally excludes these legacy packages. Static inspection
found obsolete dependencies and stale SQL selectors:

- `FAMIXNGSQLAnalysis`: `RTMondrian`, `RTArrowedLine`, `RTLegendBuilder`.
- `FamixNGSQL-GTInspectorExtension`: old GT/Glamour APIs and `GTObjectPrinter`.
- `FmxSQLFKDependenciesAnalyzer>>analyze` calls `referencedColumns`. A real current
  foreign-key constraint does not implement it. The current relation is
  `outgoingForeignKeyColumnReferences`, whose targets are columns.
- Other legacy code references `foreignKeyConstraints`, `referencedColumnsTable`
  and old concept-tag selectors and needs a separate porting review.

The Roassal 2/GT classes above are absent in the running image. These optional
packages were not loaded during the audit. Port them to Roassal 3 and current
relation APIs before advertising them as supported.

### 10. Previously identified provider-direction problem remains relevant

The installed `MiApplication>>defaultProvidersQuery` still uses `allClients`.
The existing user Butterfly window has an instance-level corrected query. This is
a separate known upstream change, represented by MooseIDE PR #1659; it was not
newly introduced or fixed by this audit. New windows must not be assumed to inherit
the existing window's override.

## Installed browser coverage

| Browser | Observed result | Scope or limitation |
| --- | --- | --- |
| Aggregator | Open/follow succeeds | Three-table input |
| Architectural Map | Renders | Tables and views; existing standard schema map has 47 nodes / 115 edges |
| Butterfly Map | Table renders; view fails | Table sample 5 nodes / 4 edges; recursive traversal blocker on view; default provider-direction issue also applies |
| Class Blueprint | SQL type rejected | Requires `FamixTType`; no SQL blueprint adapter |
| CoUsage Map | Opens with empty inner contents | Confirmed swallowed extractor error, three containers / zero inner boxes |
| Critic | Open/follow succeeds | No SQL rule suite executed |
| Dead Code | Opens; isolated analysis runs | Trigger-bound routine misclassified as dead |
| Distribution Map | Renders tables and views | Three-node samples; no tags assigned during audit, so no substantive tag distribution validated |
| DSM | Tables work; views fail | Recursive traversal blocker |
| Duplication | Routine without anchor rejected; anchored queries accepted | Actual isolated computation fails required anchor protocol |
| Export | Open/follow succeeds | Export action/file writing not exercised by this audit |
| Files | Model rejected | SQL catalog model has no source-tree `rootFolder` |
| Heat Map | Renders tables and views | Default metric is constant 1; SQL column-count metric also rendered with values 34, 8, 8 |
| Inspector | Open/follow succeeds | Fame regression checks also pass for SQL, Smalltalk and Java in this patched image |
| Layer Visualization | Opens without a visualization model | No applicable SQL implementation |
| Meta Browser | Fails on opening | Notebook/property collision, also reproduced with Smalltalk |
| Model Report | Fails | Division by zero in OO package section |
| Models Browser | Standalone window opens | Does not follow bus entities by design |
| Notebook | Open/follow succeeds | Model binding created; arbitrary notebook code/export not exercised |
| Playground | Open/follow succeeds | Entity binding created |
| Queries Browser | Root query opens | Recursive dependency actions subject to traversal failure |
| Queries Dashboard | Open/follow succeeds | No arbitrary dashboard widget suite exercised |
| Source Text | Routine and view fail | No applicable source adapter |
| System Complexity | No applicable SQL classes | Confirmed zero `isClass` entities; avoided its rejection dialog |
| Tag Browser | Open/follow succeeds | Tag mutation/deletion not exercised |
| UML | SQL type group rejected | Requires a `FamixTypeGroup`; SQL types do not supply OO class semantics |
| Logs | Standalone window opens | Does not follow bus entities directly |
| Bus Log | Configured window opens | Requires a bus/application factory |

OO class inheritance, annotation constellations, package complexity, class nesting,
system attraction and overview-pyramid metrics are not automatically meaningful
for a relational model. Their absence is an applicability gap, not evidence that
SQL classes should blindly acquire OO traits. Appropriate analogues include
schema/table nesting, foreign-key graphs, routine-call graphs and SQL metrics.

## Famix and Roassal visualizations exercised

| Visualization | Result |
| --- | --- |
| Namespace Hierarchy | 49 nodes, 0 edges |
| Overall Namespace Hierarchy | 49 nodes, 0 edges |
| Fame property tables | SQL, Smalltalk and Java fixture checks pass |
| Fame class connections, SQL View | 7 nodes, 6 edges |
| SQL metamodel UML | 95 nodes, 94 edges |
| Name Cloud | Fails for SQL and Smalltalk controls |
| RSMondrian schema/table nesting | 8 schema composites containing 206 table boxes |
| RSMondrian foreign-key graph | 35 tables, 29 directed relationships |
| RSMondrian routine-call graph | 30 routines, 12 directed relationships |

Zero edges in namespace hierarchy is expected for flat PostgreSQL schema
containment; this visualization is not a schema dependency graph.

The new examples use the same `RSMondrian nodes:forEach:`, metric normalization,
line builders and layouts as the installed class/method examples. They use SQL's
actual containment and association APIs. Dependency lines are pushed to the front.
They are bounded samples for interactive inspection, not complete database graphs.
Routine edges retain candidate targets and do not prove runtime execution.

The three example windows remain open in the running image. Reopen an existing
canvas from a Playground with, for example:

```smalltalk
(FmxSQLAuditRoassalCanvases at: 'foreign-keys')
    openWithTitle: 'SQL foreign-key dependencies'.
```

The other keys are `'nesting'` and `'routine-calls'`. To rebuild all examples,
evaluate `artifacts/audit-sql-roassal.st` in the image containing `MiFamixSQLModel`.
The script schedules UI work with `UIManager default defer:`; inspect
`FmxSQLAuditRoassalStatus` for completion.

## Suggested implementation sequence

1. Fix SQL naming and source-anchor requirements in FAMIXNGSQL, with focused
   round-trip and cross-schema/overload tests.
2. Fix scalar containment traversal upstream in MooseQuery; verify DSM, Butterfly
   and query consumers on views and enclosing schemas.
3. Add source-text support and SQL analysis strategies without making core model
   loading depend on the UI.
4. Repair the generic Meta Browser, report denominator and Name Cloud defects
   upstream, with Smalltalk/Java controls where applicable.
5. Port the optional legacy SQL visualizations or explicitly keep them unsupported.

After these changes, rerun on a fresh supported Moose image as well as the current
image. Current success of patched inspector/hierarchy tools does not establish that
a clean installation already includes those upstream fixes.
