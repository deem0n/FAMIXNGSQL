"
I am a Values clause
"
Class {
	#name : #FmxSQLValuesClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithInvocations + FmxSQLTWithAccesses + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference',
	#classTraits : 'FamixTWithInvocations classTrait + FmxSQLTWithAccesses classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLValuesClause class >> annotation [

	<FMClass: #ValuesClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLValuesClause >> isValuesClause [

	<generated>
	^ true
]
