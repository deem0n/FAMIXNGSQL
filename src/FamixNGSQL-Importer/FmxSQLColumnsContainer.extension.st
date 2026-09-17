Extension { #name : #FmxSQLColumnsContainer }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnsContainer >> isColumnsContainer [
	^ true
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnsContainer >> reachableEntities [
	^ self columns
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnsContainer >> columnNamed: aName [
	^ self columns detect: [ :column | column name = aName ]
]
