# FAMIXNGSQL

[![Tests](https://github.com/deem0n/FAMIXNGSQL/actions/workflows/tests.yml/badge.svg)](https://github.com/deem0n/FAMIXNGSQL/actions/workflows/tests.yml)

FAMIXNGSQL builds a FAMIX model of a PostgreSQL database: schemas, tables, views,
constraints, routines, triggers, source code and references between entities.
Version **2.0.0** includes the Pharo 13 / Moose 13 migration and the updated
PgMetadata and PostgreSQLParser integrations. See the [changelog](CHANGELOG.md)
for breaking changes from `v1.0.0`.

The import has two stages:

1. [PgMetadata](https://github.com/deem0n/PgMetadata) reads PostgreSQL catalogs
   through [P3](https://github.com/deem0n/P3) and builds a metadata model.
2. FAMIXNGSQL creates `FmxSQL*` entities, parses supported SQL/PL/pgSQL source
   with [PostgreSQLParser](https://github.com/deem0n/PostgreSQLParser), and resolves
   references into the model. It records incomplete analysis explicitly.

Catalog extraction and source analysis have different coverage. A successful
import preserves objects and source even when parts of their code cannot be
parsed or resolved. See [the migration audit](docs/pharo13-migration-audit.md)
for the original-model comparison, validation evidence and remaining work.

## Compatibility and dependencies

Validated on **2026-09-17**:

| Component | Tested version or revision |
| --- | --- |
| Pharo | **13.1.0SNAPSHOT** |
| Moose | **13.0.0** |
| PostgreSQL | **15.14** (Postgres.app) |
| PgMetadata | `5abe3134238b4f84f7d1e02e28d9aee45aee5c61`, included in `deem0n/PgMetadata:master` |
| PostgreSQLParser | `f9d1b0850cb7cde2839760d87f54f04ba9de315e`, group `core-no-gui` |
| SymbolResolver | `c6eb29c46cd36cabb8dff5d19329085ee8fa38c7` |
| P3 | `d45f0d358f41ff809fd85f26046a63630a3a7bef`, synchronized with upstream `svenvc/P3` |
| Famix | `4fd41546375e0ab86a4920eff547cc898e22db0b`, the Moose 13 core used for validation |
| PetitParser | `5bdaf9f36793bf355e863c1accfbcc6162a6b034` |

Validation includes the existing Pharo 13/Moose 13 image and clean CI installs
in **Pharo64-13** and **Moose64-13**, each with PostgreSQL 15. Pharo 7, Pharo 10,
other Moose versions and other PostgreSQL versions are not certified by this
migration.
Historical implementations remain available in Git history and the
[original upstream repository](https://github.com/juliendelplanque/FAMIXNGSQL).

PgMetadata alone does not require Moose, but the FAMIXNGSQL importer does.
The baseline specifies commit revisions for PgMetadata, PostgreSQLParser,
SymbolResolver, Famix and PetitParser. Upstream baselines still reference
moving branches, including Fame, P3 and other transitive dependencies, so this
is not yet a fully frozen dependency stack. The table records the revisions
observed during validation.
Deleting this repository's merged development branches does not remove the
pinned dependency commits.

## Installation

In a Pharo 13 or Moose 13/Pharo 13 Playground:

```smalltalk
Metacello new
    baseline: 'FAMIXNGSQL';
    repository: 'github://deem0n/FAMIXNGSQL:v2.0.0/src';
    load: 'Core'.
```

Keep `/src` in this repository URL. The default group also loads `Core`.
Use `:master/src` instead when intentionally testing unreleased development.

To start with Moose preinstalled, download the official
[Moose 13 / Pharo 13 image](https://github.com/moosetechnology/Moose/releases/download/continuous/Moose13-development-Pharo64-13.zip)
or select it in Pharo Launcher. It is a rolling **development** image, not an
immutable Moose 13 release. smalltalkCI selects it with `Moose64-13`.

| Group | Purpose |
| --- | --- |
| `Core` | Generated SQL metamodel and importer with their dependencies |
| `Tests` | Core, importer tests and PgMetadata scenario-test support |
| `Generator` | Core and the metamodel generator |
| `GeneratorTests` | Generator plus its global-regeneration selection regression test |
| `LegacyUI` | Historical GT Inspector, analysis, Telescope and connection-manager packages |

`LegacyUI` has not been ported or validated on the current image. Core usage does
not require those UI packages or a Genie MCP server. Loading modern Genie in a
historical Pharo 7 image is not part of the installation procedure.

## Connect and build a model

This example models **all application schemas** in the local `mi` database,
using role `bi` on port `5435`:

```smalltalk
| connection builder model |
connection := PgConnection
    hostname: 'localhost'
    port: 5435
    database: 'mi'
    user: 'bi'
    password: nil.

builder := FmxSQLModelBuilder new
    databaseName: 'mi';
    connection: connection;
    analysisTimeout: 5 seconds;
    yourself.

model := builder buildModel.
model inspect.
```

Replace the connection parameters for another server and keep both database
names consistent. `password: nil` works with the existing local authentication
used for validation; provide a password when required. It does not automatically
read `.pgpass`. The role must be able to connect and read the required catalogs.

Metadata extraction uses a **read-only, repeatable-read transaction** and closes
the connection afterwards. Parsing and reference resolution then operate on the
extracted source. The importer does not execute application routine bodies.

Application schemas exclude names beginning with `pg_` and
`information_schema`. Non-system extension and test schemas, such as `pgtap`,
are included. There is currently no schema-allowlist option on the builder.
System types and routines needed for reference resolution can appear as stubs.

`analysisTimeout:` limits source analysis **per routine or view**, not the whole
import or its database connection. Five seconds is the default. A large model
can take time to build; raising this value does not add missing parser support.

## What the model contains

| Area | Entities and relationships |
| --- | --- |
| Schemas | `FmxSQLNamespace namespaceEntities` and inverse `parentNamespace` |
| Tables | Ordinary, partitioned and foreign tables; columns, types and table inheritance |
| Views | Ordinary and materialized views, columns and original source; `isMaterialized` distinguishes the latter |
| Constraints | Primary/foreign keys, unique, not-null, CHECK and exclusion constraints |
| Constraint calls | CHECK/exclusion `storedProceduresCalled` and inverse routine relations, extracted from catalog dependencies |
| Routines | Functions/procedures, PostgreSQL OIDs, language, source, ordered parameters and parameter modes |
| Triggers | Owning table/view, invoked trigger routine, event/timing metadata and NEW/OLD references where analysis succeeds |
| Source analysis | Queries, clauses, variables, calls and structural references for supported syntax |
| Source anchors | Original source ranges attached to queries, clauses and references |

`FmxSQLStoredProcedure` is the model's historical name for general routines; it
also represents PostgreSQL functions. Trigger routines specialize it. Names
alone do not identify overloads: retain `postgresOid` and parameter information.
All generated class names use **`FmxSQL`**. A workspace variable referring to a
model of `mi` does not introduce a separate class prefix.

The model preserves original routine/view source independently of whether the
visitor could build a complete semantic representation. Unsupported languages
remain represented as catalog entities with source.

## Explore an imported model

In the same Playground used in [Connect and build a model](#connect-and-build-a-model),
`model` refers to the `FmxSQLModel` returned by `buildModel`. Count selected entity
kinds with:

```smalltalk
Dictionary newFrom: {
    #entities   -> model entities size .
    #namespaces -> (model allWithType: FmxSQLNamespace) size .
    #tables     -> (model allWithType: FmxSQLTable) size .
    #foreignTables -> (model allWithType: FmxSQLForeignTable) size .
    #views      -> (model allWithType: FmxSQLView) size .
    #routines   -> ((model allWithSubTypesOf: FmxSQLStoredProcedure) reject: #isStub) size .
    #triggers   -> (model allWithType: FmxSQLTrigger) size
	}
```

Model counts can include synthetic/system stubs; they need not equal a direct
count of application catalog rows. `allWithType:` selects the exact class,
whereas `allWithSubTypesOf:` includes specialized entities.

The remaining examples in this section run in the model Inspector, where `self`
refers to the inspected model. To run the counting example there, replace `model`
with `self`; do not assign to `self`.

Inspect routines, including trigger routines, with their source and parameters:

```smalltalk
((self allWithSubTypesOf: FmxSQLStoredProcedure) reject: #isStub)
    collect: [ :routine |
        { routine parentNamespace name.
          routine name.
          routine postgresOid.
          routine languageName.
          routine source.
          (routine parameters sorted: [ :a :b | a position < b position ]) } ].
```

Inspect each trigger's owner and invoked routine:

```smalltalk
(self allWithType: FmxSQLTrigger) collect: [ :trigger |
    { trigger parentNamespace name.
      trigger name.
      trigger table name.
      trigger storedProcedure name } ].
```

The `table` relation also accepts a view, including the owner of an
`INSTEAD OF` trigger.

### SQL queries and Moose navigation (master after v2.0.0)

SQL relations use `sqlQuery` so that `query` remains available for Moose's
navigation API:

| Entity | SQL accessor | Meaning |
| --- | --- | --- |
| `FmxSQLView` | `sqlQuery` / `sqlQuery:` | SELECT query defining the view |
| `FmxSQLDerivedTable` | `sqlQuery` / `sqlQuery:` | Query defining the derived table |
| `FmxSQLClause` and subclasses | `sqlQuery` / `sqlQuery:` | Query containing the clause |
| `FmxSQLCursor` | `sqlQuery` | Single query in the cursor's `queries` collection |

For example, in a view's Inspector:

```smalltalk
self sqlQuery. "Parsed SQL definition; can be nil after incomplete analysis"
self query. "MooseQuery navigation object"
self queryLocal: #in with: FmxSQLViewReference.
```

This is a breaking change from v2.0.0: update SQL-domain callers of `query`
and `query:`. There are no compatibility aliases or MSE property translations.
The parser AST API is unchanged. The metamodel generator defines the new names,
including the opposite relations, so regeneration preserves them.

Use a fresh image and rebuild models from PostgreSQL, or explicitly preserve
and restore the old slot values when upgrading a populated image. Older MSE
files that contain a clause's `query` property require migration before import;
new exports use `sqlQuery`. Keep the old image/export until migration is verified.

### Standard Moose Architectural Map (master after v2.0.0)

In a Moose 13 image, execute this in the imported model's Inspector:

```smalltalk
| schemas browser |
schemas := (self allWithType: FmxSQLNamespace) reject: [ :schema |
    (schema name beginsWith: 'pg_') or: [ schema name = 'information_schema' ] ].
browser := MiArchitecturalMapBrowser new.
browser open.
browser followEntity: schemas.
browser beFrozen.
```

This uses the standard browser, model, builder and default containment query.
SQL references implement Moose's dependency-query protocol because they can be
contained in routine arguments and expression groups. The map can therefore
discover association types and follow SQL bodies without custom map adapters.
Double-click a schema to expand or collapse it. Freezing keeps the map on the
selected schemas when another Moose browser changes its selection.

The diagram reflects dependencies present in the imported model; incomplete
source analysis still limits the relationships available to display. The plain
Pharo `Core` installation does not include the Architectural Map UI.

## Understand analysis coverage

In the model Inspector:

```smalltalk
| report |
report := self analysisReport.
{ report at: 'routineCounts'.
  report at: 'viewCounts'.
  report at: 'errorCount'.
  report at: 'warningCount' }.
```

Inspect routines requiring further analysis:

```smalltalk
(self analysisReport at: 'routines') reject: [ :entry |
    (entry at: 'status') = 'visited' ].
```

Each routine entry includes its schema, name, OID, language, status and
individual diagnostics. Views have corresponding entries under `views`.

| Status | Meaning |
| --- | --- |
| `visited` | Parser and visitor finished without a recorded issue; this does not prove all semantics were modeled |
| `partial` | Analysis completed with recorded warnings/errors, including unresolved references or dynamic SQL |
| `failed` | Parsing or visiting failed; the original source remains available |
| `timedOut` | Analysis exceeded the per-entity time limit |
| `unsupportedLanguage` | Routine language has no supported source-analysis path |
| `catalogOnly` | Catalog entity intentionally not analyzed as a routine body, such as an aggregate |
| `untracked` | No analysis status is present, for example on a manually created entity |

Known limitations include incomplete PostgreSQL grammar coverage, CTE/recursive
query handling, composite/record fields, accurate `search_path` resolution and
routine overload selection. Ambiguous calls retain candidate routines instead
of choosing one arbitrarily. Runtime-dependent dynamic SQL targets are not
guessed. Visitor failures are recorded while the import continues.

The measured `mi` run produced **70,143 unique entities** and retained **569
triggers**, **2,461 application routines** and **85 views**. It still had **520
syntax failures** in the Smalltalk parser. These are not PostgreSQL reporting
invalid stored code. There were also other analysis errors and warnings; syntax
failures alone are not the complete coverage report. See the
[migration audit](docs/pharo13-migration-audit.md) for the dated status breakdown.

## Export and reload

Export both the model and its diagnostics from the model Inspector:

```smalltalk
'mi.mse' asFileReference writeStreamDo: [ :stream |
    self exportToMSEStream: stream ].
'mi-analysis.json' asFileReference writeStreamDo: [ :stream |
    stream nextPutAll: (NeoJSONWriter toString: self analysisReport) ].
```

Files are written relative to the image's working directory. Choose new paths
when retaining previous exports. `NeoJSONWriter` is available in the tested
Moose image; the FAMIXNGSQL baseline does not separately declare NeoJSON.

Reload the model in a Playground with the metamodel and importer loaded:

```smalltalk
| restored |
restored := 'mi.mse' asFileReference readStreamDo: [ :stream |
    FmxSQLModel importFromMSEStream: stream ].
restored inspect.
```

Read the separate report:

```smalltalk
'mi-analysis.json' asFileReference readStreamDo: [ :stream |
    NeoJSONReader fromString: stream contents ].
```

MSE preserves modeled source and relations, but the analysis/error caches are
not serialized. Use the companion JSON to inspect the original import's
coverage; do not expect `restored analysisReport` to reconstruct it.

The validation export was checked for unique IDs and missing references and
reloaded with matching entity, routine, trigger and anchor counts. Routine/view
source text matched exactly. Database-derived files under `artifacts/` are
ignored by Git and are **not published in this repository**.

## Tests

Load the importer tests and their PgMetadata fixture support:

```smalltalk
Metacello new
    baseline: 'FAMIXNGSQL';
    repository: 'github://deem0n/FAMIXNGSQL:v2.0.0/src';
    load: 'Tests'.
```

The database scenario performs DDL. Create a **disposable database** in advance
and configure it explicitly; do not use `mi` or another application database:

```smalltalk
PgScenarioTest connectionParameters:
    (PgConnection
        hostname: 'localhost'
        port: 5435
        database: 'pgmetadata_validation_20260917'
        user: 'bi'
        password: nil).
```

The role must be allowed to create schemas, tables, routines and triggers in
that database. Each scenario creates a UUID-named schema and drops it during
teardown. The database itself must already exist.

Run all importer test classes:

```smalltalk
| suite result |
suite := TestSuite named: 'FAMIXNGSQL importer'.
{ FmxSQLSymbolResolutionVisitorTest.
  FmxSQLAnalysisReportingTest.
  FmxSQLDatabaseImportTest }
    do: [ :testClass | suite addTest: testClass suite ].
result := suite run.
result inspect.
```

All **40 importer tests** passed in the validated image. Coverage includes
symbol resolution, overload candidates, a real PostgreSQL schema with triggers
and constraint calls, timeouts, retained source, inverse relations, and MSE
identity/source round trips. Dependency suites previously passed 24 PgMetadata,
95 P3 and 246 PostgreSQLParser tests; see the audit for the validation scope.

## Continuous integration

[GitHub Actions](https://github.com/deem0n/FAMIXNGSQL/actions/workflows/tests.yml)
and [.travis.yml](.travis.yml) use the same [.smalltalk.ston](.smalltalk.ston).
Both test `Pharo64-13` and the ready-made `Moose64-13` image on Linux, against a
disposable PostgreSQL 15 container. This is a two-image compatibility matrix;
it does not establish support for other Pharo or Moose versions.

Each job loads `Tests` and `GeneratorTests` from the checked-out source and runs
**65 tests**: 40 importer, 1 generator-selection and 24 PgMetadata tests. Tests
that need a database always use explicit `FAMIXNGSQL_TEST_*` settings. Missing
settings fail the job instead of falling back to a local/application database.
The container contains no application data and is discarded after the job.

GitHub Actions runs on pushes, pull requests and manual **Run workflow**
requests. JUnit XML reports are uploaded as artifacts for each image. Travis
requires this repository to be enabled in the owner's Travis account; the YAML
configuration alone does not activate that external service.

To run the same suite locally with smalltalkCI and an existing disposable
database, set the connection parameters explicitly:

```sh
export FAMIXNGSQL_TEST_HOST=127.0.0.1
export FAMIXNGSQL_TEST_PORT=55432
export FAMIXNGSQL_TEST_DATABASE=famixngsql_ci
export FAMIXNGSQL_TEST_USER=famixngsql_ci
export FAMIXNGSQL_TEST_PASSWORD=famixngsql_ci
smalltalkci -s Moose64-13 .smalltalk.ston
```

Substitute your disposable database's settings. `Pharo64-13` selects the plain
image installation path. The passwords in the CI configurations are only for
the disposable service created inside each job.

## Metamodel development

Generated entities live in `src/FamixNGSQL`; importer extensions live in
`src/FamixNGSQL-Importer`. Change the generator in
`src/FAMIXNGSQLMetamodelGenerator` when changing the metamodel, then regenerate
and review the generated diff. Keep handwritten importer behavior separate.

Load the generator:

```smalltalk
Metacello new
    baseline: 'FAMIXNGSQL';
    repository: 'github://deem0n/FAMIXNGSQL:v2.0.0/src';
    load: 'Generator'.
```

Construct its definitions without installing regenerated classes:

```smalltalk
FmxSQLMetamodelGenerator new define.
```

`FmxSQLStructuralMetamodelGenerator` is an abstract base, so Moose's global
regeneration selects only the concrete `FmxSQLMetamodelGenerator`. If an older
loaded version reports `SubclassResponsibility` for the base class's `prefix`,
load the updated generator, abandon the failed regeneration, and start it again.
Its already-created generator list still contains the abstract class; resuming
that old operation does not rebuild the list.

The selection regression can be checked without regenerating classes:

```smalltalk
Metacello new
    baseline: 'FAMIXNGSQL';
    repository: 'github://deem0n/FAMIXNGSQL:v2.0.0/src';
    load: 'GeneratorTests'.
FmxSQLMetamodelGeneratorTest suite run inspect.
```

Perform actual regeneration in a disposable development image after releasing
model instances. `FmxSQLMetamodelGenerator new generateWithCleaning` removes and
recreates the generated package; reload the handwritten extensions afterwards.
Live migration of a large model can take minutes. Extension-package ownership
across regeneration still needs a regression check; it is tracked in
[issue #8](https://github.com/deem0n/FAMIXNGSQL/issues/8).

Export generated source to an empty directory and review replacement of the
old generated package. Overlaying an export leaves stale definitions behind.
In particular, `FmxSQLUnknownSourceLanguage` is obsolete: its former
`FamixTUnknownSourceLanguage` trait no longer exists in the tested Moose image.
Do not restore that class merely to silence an old-image load warning.

The generator preserves namespace ownership, source-holder/anchor direction,
CHECK/exclusion routine links and reciprocal associations. MSE regression tests
must continue checking identity and inverse relations, not only whether an
export can be parsed.

## License and origins

Distributed under the [MIT license](LICENSE). This fork builds on
[Julien Delplanque's FAMIXNGSQL](https://github.com/juliendelplanque/FAMIXNGSQL),
with updated metadata extraction, SQL parsing and Moose metamodel integration.
