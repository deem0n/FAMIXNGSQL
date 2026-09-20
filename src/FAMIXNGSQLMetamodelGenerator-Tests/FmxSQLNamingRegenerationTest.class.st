Class {
 #name : #FmxSQLNamingRegenerationTest,
 #superclass : #TestCase,
 #category : #'FAMIXNGSQLMetamodelGenerator-Tests'
}
{ #category : #tests }
FmxSQLNamingRegenerationTest >> testNamesSurviveGeneration [
 | before after |
 before := (MCPackage named: 'FamixNGSQL') snapshot.
 FmxSQLMetamodelGenerator generate.
 after := (MCPackage named: 'FamixNGSQL') snapshot.
 self assertEmpty: (after patchRelativeToBase: before) operations.
 self assert: ((FmxSQLNamedEntity >> #mooseName) package name) equals: 'FamixNGSQL-Importer'.
 self assert: (FmxSQLNamespace new name: 'test'; yourself) mooseName equals: 'Namespace:"test"'
]
