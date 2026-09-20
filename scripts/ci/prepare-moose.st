"Use immutable archive dependencies, independent of prebuilt Iceberg checkouts.
 Only affects the disposable CI image."
Iceberg enableMetacelloIntegration: false.
IceRepository registry copy do: [ :repository |
    IceRepository unregisterRepository: repository ifAbsent: [ ] ].

"Moose 13 already supplies these tools and their dependencies. Load complete
 packages from the pinned fork, avoiding unrelated moving baseline dependencies.
 The MooseIDE fork itself is separately tested from clean Pharo by its full CI."
[ | repository loader |
repository := MCGitHubRepository location:
    'github://deem0n/MooseIDE:0078da66db3575346e3a25402a90684686234f07/src'.
loader := MCVersionLoader new.
#('MooseIDE-Core' 'MooseIDE-Core-Reporter' 'MooseIDE-LayerVisualization'
  'MooseIDE-Meta' 'MooseIDE-Tests') do: [ :packageName |
    loader addVersion: (repository packageNamed: packageName) ].
loader load ] value.
