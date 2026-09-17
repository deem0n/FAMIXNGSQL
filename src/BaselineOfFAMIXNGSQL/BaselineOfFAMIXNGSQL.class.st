Class {
	#name : #BaselineOfFAMIXNGSQL,
	#superclass : #BaselineOf,
	#category : #BaselineOfFAMIXNGSQL
}

{ #category : #baselines }
BaselineOfFAMIXNGSQL >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #FAMIXNGSQLMetamodelGenerator
					with: [ spec requires: #('Famix') ];
				package: #'FAMIXNGSQLMetamodelGenerator-Tests'
					with: [ spec requires: #('FAMIXNGSQLMetamodelGenerator') ];
				package: #'FamixNGSQL-Importer'
					with: [ spec
						requires: #('FamixNGSQL' 'PostgreSQLParser' 'PgMetadata' 'SymbolResolver' 'PetitParser') ];
				package: #'FamixNGSQL-Importer-Tests'
					with: [ spec requires: #('FamixNGSQL-Importer' 'PgMetadata-Tests') ];
				package: #'FamixNGSQL-GTInspectorExtension'
					with: [ spec requires: #('FamixNGSQL-Importer') ];
				package: #FAMIXNGSQLAnalysis
					with: [ spec requires: #('TelescopeCytoscape') ];
				package: #FamixNGSQL with: [ spec requires: #('Famix') ];
				package: #'FAMIXNGSQLAnalysis-ConnectionsManager'
					with: [ spec requires: #('DBConnectionsManager') ].
			spec
				baseline: 'Famix'
				with: [ spec
						repository: 'github://moosetechnology/Famix:development/src';
						loads: #('Core' 'Basic') ].
			spec
				baseline: 'SymbolResolver'
				with: [ spec repository: 'github://Larcheveque/SymbolResolver:c6eb29c46cd36cabb8dff5d19329085ee8fa38c7/src' ].
			spec
				baseline: 'PostgreSQLParser'
				with: [ spec
						repository: 'github://deem0n/PostgreSQLParser:f9d1b0850cb7cde2839760d87f54f04ba9de315e/src';
						loads: #('core-no-gui') ].
			spec
				baseline: 'PetitParser'
				with: [ spec
						loads: #('Preprocessor');
						repository: 'github://moosetechnology/PetitParser/src' ].
			spec
				baseline: 'PgMetadata'
				with: [ spec
					repository: 'github://deem0n/PgMetadata:5abe3134238b4f84f7d1e02e28d9aee45aee5c61';
					loads: #('Core') ].
			spec project: 'PgMetadata-Tests' copyFrom: 'PgMetadata'
				with: [ spec loads: #('Tests') ].
			spec
				baseline: 'DBConnectionsManager'
				with: [ spec
						repository: 'github://juliendelplanque/DBConnectionsManager/repository';
						loads: 'pgmetadata' ].
			spec
				baseline: 'TelescopeCytoscape'
				with: [ spec
						repository: 'github://TelescopeSt/TelescopeCytoscape:v2.x.x/src' ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('FamixNGSQL' 'FamixNGSQL-Importer');
				group: 'Generator' with: #('Core' 'FAMIXNGSQLMetamodelGenerator');
				group: 'GeneratorTests' with: #('Generator' 'FAMIXNGSQLMetamodelGenerator-Tests');
				group: 'Tests' with: #('Core' 'FamixNGSQL-Importer-Tests');
				group: 'LegacyUI' with: #('Core' 'FamixNGSQL-GTInspectorExtension' 'FAMIXNGSQLAnalysis' 'FAMIXNGSQLAnalysis-ConnectionsManager') ]
]
