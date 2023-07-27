"
I am a from clause
"
Class {
	#name : #FmxSQLFromClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithInvocations + FmxSQLTWithAccesses + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference + FmxSQLTWithNamespaceReference + FmxSQLTWithReferencesGroupReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithInvocations classTrait + FmxSQLTWithAccesses classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithReferencesGroupReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLFromClause class >> annotation [

	<FMClass: #FromClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLFromClause >> isFromClause [

	<generated>
	^ true
]
