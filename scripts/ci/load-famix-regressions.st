"Load regression classes from the same immutable Famix commit as the baseline.
 The prebuilt image contains their Java/Smalltalk test model dependencies."
| repository loader |
repository := MCGitHubRepository location:
    'github://deem0n/Famix:50bb4f82506561512c5fa4692285bf01592732bd/src'.
loader := MCVersionLoader new.
#('Famix-Visualizations' 'Moose-Core-Tests' 'Moose-Query-Test') do: [ :packageName |
    loader addVersion: (repository packageNamed: packageName) ].
loader load.
#(MiMetaBrowserRegressionTest MiModelReportRegressionTest MiLayerApplicabilityTest
  MiApplicationTest MiButterflyMapModelTest MiButterflyMapBrowserTest
  MooseGroupNameCloudTest MQNavigationContainmentTest) do: [ :name |
    Smalltalk at: name ifAbsent: [ self error: 'Missing required regression class: ', name ] ].
