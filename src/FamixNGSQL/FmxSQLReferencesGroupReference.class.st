"
TODO
"
Class {
	#name : #FmxSQLReferencesGroupReference,
	#superclass : #FmxSQLReference,
	#traits : 'FmxSQLTReferencesGroupReference + TEntityMetaLevelDependency',
	#classTraits : 'FmxSQLTReferencesGroupReference classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLReferencesGroupReference class >> annotation [

	<FMClass: #ReferencesGroupReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]
