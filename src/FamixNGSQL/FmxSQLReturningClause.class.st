"
I am a returning clause
"
Class {
	#name : #FmxSQLReturningClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithInvocations + FmxSQLTWithAccesses + FmxSQLTWithColumnReference + FmxSQLTWithReferencesGroupReference',
	#classTraits : 'FamixTWithInvocations classTrait + FmxSQLTWithAccesses classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithReferencesGroupReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLReturningClause class >> annotation [

	<FMClass: #ReturningClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLReturningClause >> isReturningClause [

	<generated>
	^ true
]
