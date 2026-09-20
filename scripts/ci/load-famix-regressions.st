"Load regression classes from the same immutable Famix commit as the baseline.
 The prebuilt image contains their Java/Smalltalk test model dependencies."
| repository loader |
repository := MCGitHubRepository location:
    'github://deem0n/Famix:a4c7ab04868fc924bb0ca470142c60d8576f6a17/src'.
loader := MCVersionLoader new.
#('Famix-Visualizations' 'Famix-Visualizations-Tests' 'Moose-Core-Tests' 'Moose-Query-Test') do: [ :packageName |
    loader addVersion: (repository packageNamed: packageName) ].
loader load.
#(MiMetaBrowserRegressionTest MiModelReportRegressionTest MiLayerApplicabilityTest
  MiApplicationTest MiButterflyMapModelTest MiButterflyMapBrowserTest
  MooseGroupNameCloudTest MQNavigationContainmentTest FamixNamespaceGroupHierarchyTest MooseGroupTest) do: [ :name |
    Smalltalk at: name ifAbsent: [ self error: 'Missing required regression class: ', name ] ].
