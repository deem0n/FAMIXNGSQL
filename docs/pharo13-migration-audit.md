# Pharo 13 / Moose 13 migration audit

## Reference sources

- Original upstream cached revision: `d8c6427245ff8fbae6401e956db2b0759bb5a2d0`.
- User fork before Moose migration: `7af7700305360d03f4af5292c3f73418979ec434`.
- Existing incomplete Moose 10 migration: `83d53793d4509965f47d4c12def300a55fd26750`.
- The requested exclusion-constraint/routine relation is an explicit requirement,
  even though it is absent from these checked-in behavioural generator versions.

## Invariants to preserve

Namespaces own named SQL objects; tables/views own columns; routines own ordered
parameters, local variables and queries; queries own clauses; references retain
source ranges and source/target direction. Trigger entities retain their owning
table or view and the invoked routine. CHECK and exclusion constraints retain
called routines with inverse links from each routine. Unsupported code remains
available as source and failures must be reported, never treated as successful
analysis.

## Compatibility changes reviewed

- Regenerate the checked-in `FamixNGSQL` package on current Moose. Its old
  `FmxSQLUnknownSourceLanguage` definition referenced the removed
  `FamixTUnknownSourceLanguage` trait and caused a post-mortem load warning.
  Current generation does not emit that class. Remove stale generated files
  when exporting; exporting over an existing directory alone leaves them behind.
- Empty `TNamedEntity`, `TWithImmediateSource`, and `TWithAccesses` placeholders
  from the Moose 10 migration lost namespace, source and access behaviour.
  Restore the namespace relation and use current source/access traits.
- `TSourceAnchor` describes an anchor, not the query/clause holding an anchor.
  Restore source-entity behaviour on queries, clauses and reference groups.
- Restore association and entity dependency-query traits. Use `FmxSQLModel`
  consistently so source/target metadata comes from the SQL metamodel.
- Remove the duplicate CheckConstraint superclass declaration; it is already
  defined by the structural generator.
- Moose 13 no longer has `withoutPrimaryContainer`. Preserve both relation
  endpoints and composition through the existing `<>-`/`<>-*` commands.
  There is no replacement that disables the relation or drops its inverse.
- Use a trigger-owner trait shared by tables and views, preserving the public
  `table` / `triggers` relation names.
- Keep the CHECK/routine relation and add the requested exclusion/routine
  relation. Populate both from catalog dependencies, including exclusion index
  expressions, with OID-based identity.
- Preserve materialized views and source definitions, routine OIDs/languages,
  unnamed parameters, argument order/modes, and SQL-standard routine bodies.
- Dispatch SQL and PL/pgSQL bodies to their respective grammar entry points.
  Parsing must preserve original source offsets, including semicolons in strings.

## Validation scope

Tests and live coverage results are recorded separately. Passing structural tests
is not proof of complete parsing of real database source. A full-model build must
report failed/partial analysis and retain the corresponding original source.

## Measured validation (2026-09-17)

Validated in the running Pharo 13 / Moose 13 image against PostgreSQL 15.14.
P3 master was fast-forwarded to upstream `d45f0d358f41ff809fd85f26046a63630a3a7bef`
and pushed; its 95 tests passed against a disposable database. PgMetadata's 24
tests passed, including constraint/routine links and the read-only extraction
transaction. PostgreSQLParser passed 133 grammar tests, 103 AST-builder tests,
7 facade tests, and 3 AST tests. The importer has 38 passing tests (including a
real PostgreSQL integration scenario and MSE source-anchor export).

The regenerated metamodel was exported to an empty directory and reloaded
successfully. No generated definition refers to `FamixTUnknownSourceLanguage`.
The production importer and its tests now have separate packages.

The full local database build produced 81,488 model entities. Application catalog
counts were independently checked with SQL: 47 schemas, 359 tables, 5 foreign
tables, 85 ordinary/materialized views, 2,461 routines, and 569 triggers.
Generated system stubs are additional model entities.

Routine statuses: 938 visited, 286 partial, 717 failed, 7 timed out, 511 in
unsupported languages, and 2 aggregate catalog objects. View statuses: 42
visited, 12 partial, 31 failed. Syntax failures across routines/views fell from
799 to 520 after the schema-qualified call, declaration, and EXECUTE repairs.
The larger model exposes more unresolved references; there are 1,833 recorded
errors and 346 warnings overall. These counts are observations, not a claim of
complete PostgreSQL semantics or dependency coverage.

The MSE artifact retains source and structural/reference relations. A separate
JSON report records per-entity status and diagnostics. Local database artifacts
are ignored by Git. No fresh-image Metacello install or legacy UI validation has
been performed.

## Remaining work

- CTEs, recursive queries, set-returning functions, and other modern PostgreSQL
  syntax still exceed the old grammar/visitor in many cases.
- Resolve unqualified object names with the actual PostgreSQL search_path and
  overload rules. Calls currently retain all matching overload candidates.
- Model composite/record type fields and more PL/pgSQL statement semantics.
- Analyse constant dynamic SQL where possible; runtime-dependent SQL is reported
  explicitly and its targets are not guessed.
- Remove remaining visitor Halts with supported semantics and regression tests;
  the importer currently records them as failures and continues.
- Pin/validate the complete dependency stack in a fresh image before a release.
