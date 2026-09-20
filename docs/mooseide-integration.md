# Optional Moose 13 integration

In a Moose 13 / Pharo 13 image with MooseIDE already installed, load the `MooseIDE`
group of FAMIXNGSQL. `MooseIDETests` adds its regression tests. The plain `Core`
group does not load these packages or require the Moose UI.

```smalltalk
Metacello new
    baseline: 'FAMIXNGSQL';
    repository: 'github://deem0n/FAMIXNGSQL:master/src';
    load: 'MooseIDE'.
```

The Source Text browser automatically selects the SQL adapter. Routine and view
sources display without filesystem anchors. AST highlights are translated from
owner-relative intervals into the displayed fragment; absent, invalid, unrelated
or outside-fragment intervals produce no highlight. Definitions are not modified.

The dependency pin includes the cardinality-aware MooseQuery fix from
`deem0n/Famix` PR #2, required for views with scalar query containment. This is
fork-first v3 development work, not a published v3 release.

GitHub CI loads these optional tests in the ready-made Moose image. The plain
Pharo job continues to test Core without GUI dependencies.

## SQL duplication analysis

Choose **PostgreSQL** as the source cleaner in the standard Duplication Browser settings, or open it with the preset:

```smalltalk
FmxSQLReplicationCleaner openOn: (model entities select: [ :entity |
    entity hasSourceAnchor and: [ entity sourceAnchor hasSourceText ] ]).
```

The cleaner preserves SQL literals, quoted identifiers and dollar-quoted bodies; removes line and nested block comments; and keeps original line numbers. Whitespace inside literals stays significant. It assumes PostgreSQL `standard_conforming_strings = on`; explicit `E` strings support escaped quotes. Unterminated lexical input raises an error instead of silently changing its meaning. Dollar-quoted bodies are compared verbatim, without recursively interpreting their language. This is lexical clone detection, not semantic SQL equivalence. Thresholds remain configurable in the standard browser.
