"
I am a group by clause
"
Class {
	#name : #FmxSQLGroupByClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithInvocations + FmxSQLTWithAccesses + FmxSQLTWithColumnReference + FmxSQLTWithNamespaceReference + FmxSQLTWithReferencesGroupReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithInvocations classTrait + FmxSQLTWithAccesses classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithReferencesGroupReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLGroupByClause class >> annotation [

	<FMClass: #GroupByClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLGroupByClause >> isGroupByClause [

	<generated>
	^ true
]
