"
I am a having clause
"
Class {
	#name : #FmxSQLHavingClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithInvocations + FmxSQLTWithAccesses + FmxSQLTWithColumnReference + FmxSQLTWithNamespaceReference + FmxSQLTWithReferencesGroupReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithInvocations classTrait + FmxSQLTWithAccesses classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithReferencesGroupReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLHavingClause class >> annotation [

	<FMClass: #HavingClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLHavingClause >> isHavingClause [

	<generated>
	^ true
]
