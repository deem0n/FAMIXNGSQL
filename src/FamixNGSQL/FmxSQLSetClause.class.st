"
I am a set clause
"
Class {
	#name : #FmxSQLSetClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithInvocations + FmxSQLTWithAccesses + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference',
	#classTraits : 'FamixTWithInvocations classTrait + FmxSQLTWithAccesses classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLSetClause class >> annotation [

	<FMClass: #SetClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLSetClause >> isSetClause [

	<generated>
	^ true
]
