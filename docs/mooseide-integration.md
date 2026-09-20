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
