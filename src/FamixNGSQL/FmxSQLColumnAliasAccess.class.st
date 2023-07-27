Class {
	#name : #FmxSQLColumnAliasAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTAccess classTrait + FmxSQLTWithQualifiedReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLColumnAliasAccess class >> annotation [

	<FMClass: #ColumnAliasAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]
