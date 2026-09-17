Class {
	#name : #FmxSQLMetamodelGeneratorTest,
	#superclass : #TestCase,
	#category : #'FAMIXNGSQLMetamodelGenerator-Tests'
}

{ #category : #tests }
FmxSQLMetamodelGeneratorTest >> testGlobalRegenerationSkipsStructuralBase [
	| generators |
	self assert: FmxSQLStructuralMetamodelGenerator isAbstract.
	self deny: FmxSQLMetamodelGenerator isAbstract.
	generators := FamixMetamodelGenerator metamodelsToGenerate.
	self deny: (generators includes: FmxSQLStructuralMetamodelGenerator).
	self assert: (generators includes: FmxSQLMetamodelGenerator).
	self assert: FmxSQLMetamodelGenerator prefix equals: #FmxSQL.
	self assert: FmxSQLMetamodelGenerator packageName equals: #FamixNGSQL
]
