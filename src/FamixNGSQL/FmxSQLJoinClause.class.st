"
I am a join clause
"
Class {
	#name : #FmxSQLJoinClause,
	#superclass : #FmxSQLClause,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLJoinClause class >> annotation [

	<FMClass: #JoinClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLJoinClause >> isJoinClause [

	<generated>
	^ true
]
