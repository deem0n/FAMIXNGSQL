# Changelog

## 2.0.0 — 2026-09-17

This is the Pharo 13 / Moose 13 migration of FAMIXNGSQL. It supersedes the
historical Pharo 7 release; the `v1.0.0` tag remains unchanged.

### Breaking changes

- Use `github://deem0n/FAMIXNGSQL:v2.0.0/src` to install the release. Packages use
  Tonel under `src`; historical `/repository` loading instructions do not apply.
- Use `FmxSQLModel` in place of the historical `FmxSQLMooseModel`.
- Generated classes and traits target the current Famix infrastructure. Pharo 7,
  Pharo 10 and older Moose versions are not supported by this release's tests.
- The default group is `Core`. Historical GT/Telescope/connection-manager UI
  packages are isolated in `LegacyUI` and are not validated for this release.
- Regenerated containment and source-anchor relations may differ from older
  MSE exports. Cross-version import of historical MSE files is not guaranteed.

### Model and importer

- Restore namespace ownership, association direction and source-holder/anchor
  relationships on the current metamodel builder.
- Preserve CHECK and exclusion constraint calls to routines and inverse links.
- Integrate updated PgMetadata extraction through upstream P3 code, including
  materialized views, partitioned/foreign tables, routine OIDs/languages,
  parameter order/modes and trigger ownership on tables or views.
- Read catalogs in a read-only, repeatable-read transaction and close the
  metadata connection after extraction.
- Use separate SQL and PL/pgSQL parser entry points. Preserve source when
  syntax, language or name resolution is unsupported.
- Record per-object analysis status, diagnostics and timeouts. Ambiguous calls
  retain candidate routines; runtime-dependent dynamic SQL targets are not guessed.
- Preserve entity identity, inverse relations and source anchors through MSE
  export/import. Export diagnostics separately as JSON.
- Exclude the abstract structural base generator from global regeneration.

### Tests and continuous integration

- Share smalltalkCI configuration between Travis CI and GitHub Actions.
- Test both a plain Pharo 13 image and the ready-made Moose 13 / Pharo 13 image
  against a disposable PostgreSQL 15 service.
- Run importer, metamodel-generator selection and PgMetadata suites. Fixtures
  create unique schemas and clean them up after each scenario.

### Known limits

- SQL/PL/pgSQL parsing and semantic analysis are incomplete. The documented `mi`
  import retained 70,143 unique entities but still reported 520 parser syntax
  failures and additional reference-resolution errors. Consult the analysis
  report rather than treating a completed import as complete source coverage.
- The upstream Moose 13 image is a rolling development build. Other runtime
  combinations and `LegacyUI` remain unvalidated.
- Some transitive dependencies still follow upstream branches; the dependency
  stack is not fully frozen by the FAMIXNGSQL tag alone.
- Package ownership after metamodel regeneration remains tracked in issue #8.

See [README](README.md) for installation and examples, and the
[migration audit](docs/pharo13-migration-audit.md) for detailed evidence.

## 1.0.0 — 2019-09-02

Historical upstream release for Pharo 7:
[release notes](https://github.com/juliendelplanque/FAMIXNGSQL/releases/tag/v1.0.0).
