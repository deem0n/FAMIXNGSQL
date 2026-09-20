# FAMIXNGSQL v3.0.0 qualification

Status: review and integration candidate, not a published release. Track all work in the [v3.0.0 milestone](https://github.com/deem0n/FAMIXNGSQL/milestone/1). The [installed-image audit](moose-compatibility-audit.md) records the original failures and limits of coverage.

## Separate fixes

| Issue | Change | Implementation PR |
|---|---|---|
| [#11](https://github.com/deem0n/FAMIXNGSQL/issues/11) | Qualified SQL names and overloads | [SQL #26](https://github.com/deem0n/FAMIXNGSQL/pull/26) |
| [#12](https://github.com/deem0n/FAMIXNGSQL/issues/12) | Source-anchor protocol | [SQL #25](https://github.com/deem0n/FAMIXNGSQL/pull/25) |
| [#13](https://github.com/deem0n/FAMIXNGSQL/issues/13) | Scalar containment traversal | [Famix #2](https://github.com/deem0n/Famix/pull/2) |
| [#14](https://github.com/deem0n/FAMIXNGSQL/issues/14) | Standard Source Text browser | [SQL #27](https://github.com/deem0n/FAMIXNGSQL/pull/27) |
| [#15](https://github.com/deem0n/FAMIXNGSQL/issues/15) | SQL CoUsage preset | [SQL #28](https://github.com/deem0n/FAMIXNGSQL/pull/28) |
| [#16](https://github.com/deem0n/FAMIXNGSQL/issues/16) | Conservative dead-code preset | [SQL #29](https://github.com/deem0n/FAMIXNGSQL/pull/29) |
| [#17](https://github.com/deem0n/FAMIXNGSQL/issues/17) | SQL duplication cleaner | [SQL #30](https://github.com/deem0n/FAMIXNGSQL/pull/30) |
| [#18](https://github.com/deem0n/FAMIXNGSQL/issues/18) | Reject unsupported Layer Visualization inputs | [MooseIDE #4](https://github.com/deem0n/MooseIDE/pull/4) |
| [#19](https://github.com/deem0n/FAMIXNGSQL/issues/19) | Non-OO model report | [MooseIDE #2](https://github.com/deem0n/MooseIDE/pull/2) |
| [#20](https://github.com/deem0n/FAMIXNGSQL/issues/20) | Meta Browser Spec properties | [MooseIDE #1](https://github.com/deem0n/MooseIDE/pull/1) |
| [#21](https://github.com/deem0n/FAMIXNGSQL/issues/21) | Name Cloud | [Famix #1](https://github.com/deem0n/Famix/pull/1) |
| [#22](https://github.com/deem0n/FAMIXNGSQL/issues/22) | Roassal 3 SQL views | [SQL #31](https://github.com/deem0n/FAMIXNGSQL/pull/31) |
| [#23](https://github.com/deem0n/FAMIXNGSQL/issues/23) | Correct provider direction | [MooseIDE #3](https://github.com/deem0n/MooseIDE/pull/3) |
| [#24](https://github.com/deem0n/FAMIXNGSQL/issues/24) | Combined CI, immutable pins and release gate | This integration PR |

## Dependencies and merge order

All PRs target deem0n forks first. Famix #1/#2 and MooseIDE #1–#4 are independent review units. The draft [Famix #3](https://github.com/deem0n/Famix/pull/3) and [MooseIDE #5](https://github.com/deem0n/MooseIDE/pull/5) combine them solely for qualification; merge individual fixes first. SQL #25 and #26 can be reviewed independently. SQL #27 is stacked on #25, and #28–#31 on #27; retarget each to master after its prerequisite is merged.

This branch combines the SQL fixes and pins Famix `50bb4f82506561512c5fa4692285bf01592732bd`. The Moose CI configuration additionally pins MooseIDE `0078da66db3575346e3a25402a90684686234f07`. These are immutable qualification commits containing the separate PRs, not moving upstream development branches. After review, ensure the same fixes are reachable from the fork default branches and refresh pins if review changes them.

## Validation and release gates

The CI matrix is clean Pharo 13 core/importer/generator tests and prebuilt Moose 13 with optional UI tests, both against PostgreSQL 15. CI unregisters stale Iceberg checkout registrations in the disposable prebuilt image and uses archive downloads, so absent build-machine directories cannot override pinned forks. MooseIDE fork CI needs repository variable `MOOSE_PHARO_VERSIONS={"Moose-latest":["Pharo64-13"]}` because upstream organization variables are not inherited by a fork.

Combined isolated validation: 172 passed, 2 skipped, zero failures/errors across SQL and generic-tool regression suites. The two existing Butterfly Map skips remain visible; no tests were disabled to obtain this result. Model Report HTML export emits an existing undeclared MicHTMLVisitor warning and is not qualified by the text-report fix. Individual SQL PRs #25–#31 passed both CI image jobs after correcting the prebuilt-image loading configuration. Consult each current commit's checks; this is a dated validation record, not a promise about future commits.

- [ ] Review and merge every separate implementation PR.
- [ ] All milestone issues, including existing regeneration issue #8, meet their acceptance criteria.
- [ ] Combined clean Pharo 13 / Moose 13 / PostgreSQL 15 CI passes at the final dependency pins.
- [ ] Full metamodel regeneration and MSE tests pass without unexpected generated changes.
- [ ] Reimport all application schemas of local `mi` and repeat the installed-tool acceptance matrix at final pins; verify identities, relationships and parse-analysis reports.
- [ ] Check the supported tool paths interactively, including source highlights, selected clone display and graph navigation; record rejected/inapplicable tools honestly.
- [ ] Confirm no database artifacts or credentials are tracked.
- [ ] Publish v3.0.0 only after the above gates; do not reuse v1.0.0/v2.0.0 tags.

The issue/PR set implements discovered incompatibilities. It does not imply universal compatibility with all Moose plugins, semantic SQL clone detection, complete parsing of dynamic SQL, or invented OO metrics/layer semantics. The installed-tool audit and final acceptance run define the evidence.

## Breaking changes and loading

Qualified Moose names change lookup/cache/export identifiers; see [naming migration](sql-moose-names.md). The unsupported LegacyUI load group is retired. Core stays independent of GUI packages; optional standard-tool adapters and Roassal 3 views use `MooseIDE`/`MooseIDETests` groups and require MooseIDE already installed. SQL CoUsage, dead-code and duplication use explicit SQL presets; see [working snippets](mooseide-integration.md). The generic OO defaults must not be assumed to carry SQL semantics.

Qualification scope is Pharo 13/Moose 13/PostgreSQL 15. Do not advertise Pharo 7–12, Moose 12, Pharo 14 or other PostgreSQL versions as supported by v3 until their own clean matrix is green. Famix's broader fork matrix is separate evidence, not full-stack SQL qualification.
