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

## Roassal 3 SQL views

The builders return unopened `RSCanvas` objects. Use any imported SQL model; there is no global `mi` dependency or implicit schema filter. For large databases pass a deliberately selected model, since all matching entities are drawn.

```smalltalk
(FmxSQLRoassalViews schemaTablesIn: model) openWithTitle: 'Schemas and tables'.
(FmxSQLRoassalViews foreignKeysIn: model) openWithTitle: 'Foreign keys'.
(FmxSQLRoassalViews routineCallsIn: model) openWithTitle: 'Routine call candidates'.
```

Schema boxes contain table boxes, like class/method nesting examples. Foreign-key arrows point from the referencing table to the referenced table; composite references collapse to one edge. Call arrows point from the enclosing routine to every candidate routine, including trigger routines. Candidate edges are static-analysis evidence, not proof of runtime calls. Disconnected entities remain visible; endpoints outside the supplied model are omitted. Edges are placed above nodes, and no entities or relationships are changed. Empty models yield empty canvases.

The historical Roassal 2/GT/Telescope sources remain in the repository for migration reference, but the unsupported `LegacyUI` load group is retired in v3. These Roassal 3 builders use current association APIs and replace the advertised visualization entry points.
