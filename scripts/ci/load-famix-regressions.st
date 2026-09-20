"Load regression classes from the same immutable Famix commit as the baseline.
 The prebuilt image contains their Java/Smalltalk test model dependencies."
| repository loader |
repository := MCGitHubRepository location:
    'github://deem0n/Famix:717dd2585713467ea11a0dab729d1b1459801017/src'.
loader := MCVersionLoader new.
#('Famix-Visualizations' 'Famix-Visualizations-Tests' 'Moose-Core-Tests' 'Moose-Query-Test') do: [ :packageName |
    loader addVersion: (repository packageNamed: packageName) ].
loader load.
#(MiMetaBrowserRegressionTest MiModelReportRegressionTest MiLayerApplicabilityTest
  MiApplicationTest MiButterflyMapModelTest MiButterflyMapBrowserTest
  MooseGroupNameCloudTest MQNavigationContainmentTest FamixNamespaceGroupHierarchyTest MooseGroupTest) do: [ :name |
    Smalltalk at: name ifAbsent: [ self error: 'Missing required regression class: ', name ] ].
