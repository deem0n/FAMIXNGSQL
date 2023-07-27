Class {
	#name : #FmxSQLColumnsContainerAliasAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTAccess classTrait + FmxSQLTWithQualifiedReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLColumnsContainerAliasAccess class >> annotation [

	<FMClass: #ColumnsContainerAliasAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]
