# FAMIXNGSQL

A FAMIX model of PostgreSQL databases, including schemas, tables, views,
constraints, routines, triggers, and source-level references.

## Pharo 13 / Moose 13 integration

The `pharo13-pgmetadata-integration` branch restores the original metamodel
relationships on current Moose and integrates the updated PgMetadata and parser.
See [the migration audit](docs/pharo13-migration-audit.md) for changes and limits.

The current validation uses an existing Moose 13 image on Pharo 13 and
PostgreSQL 15.14. A fresh-image Metacello installation has not yet been validated.
The core avoids the old GT/Telescope UI dependencies; `LegacyUI` is optional
and has not been ported or validated.

```smalltalk
Metacello new
  repository: 'github://deem0n/FAMIXNGSQL:pharo13-pgmetadata-integration/src';
  baseline: 'FAMIXNGSQL';
  load: 'Core'.
```

## Build a model

```smalltalk
model := (FmxSQLModelBuilder new
  databaseName: 'mi';
  connection: (PgConnection hostname: 'localhost' port: 5435
    database: 'mi' user: 'bi' password: nil);
  analysisTimeout: 5 seconds;
  yourself) buildModel.
model inspect.
model analysisReport inspect.
```

Metadata extraction reads all application schemas, excluding `pg_*` and
`information_schema`. It uses a read-only repeatable-read transaction. Internal
routine stubs remain available for reference resolution.

SQL and PL/pgSQL source is parsed with the corresponding grammar. All routine
source is retained, including unsupported languages. Analysis is bounded per
entity and records `visited`, `partial`, `failed`, `timedOut`,
`unsupportedLanguage`, or `catalogOnly`. **`visited` means the parser and visitor
finished without a recorded issue, not proof that every SQL construct is modeled.**
Dynamic SQL is reported as partial; its runtime targets are not inferred.
Ambiguous routine overloads retain multiple invocation candidates. Unqualified
names still need more accurate PostgreSQL `search_path` handling.

Export both the model and its diagnostics (analysis caches are not serialized
by MSE):

```smalltalk
'mi.mse' asFileReference writeStreamDo: [ :stream |
  model exportToMSEStream: stream ].
'mi-analysis.json' asFileReference writeStreamDo: [ :stream |
  stream nextPutAll: (NeoJSONWriter toString: model analysisReport) ].
```

## Tests and regeneration

Load the `Tests` group. Run database scenarios only against a disposable database:

```smalltalk
PgScenarioTest connectionParameters:
  (PgConnection hostname: 'localhost' port: 5435
    database: 'pgmetadata_validation_20260917' user: 'bi' password: nil).
```

Load `Generator` to modify the metamodel. Release references to existing models
before regenerating; live class migration of large models can take minutes.
Use `FmxSQLMetamodelGenerator new generateWithCleaning`, then export the package
to an empty directory and replace the old generated package. Overlaying files
can leave obsolete classes behind, including `FmxSQLUnknownSourceLanguage`,
whose old trait no longer exists in Moose 13.

The original Pharo 7 code is available from the upstream repository/history.
Installing modern Genie in that old image is not required for this migration.
