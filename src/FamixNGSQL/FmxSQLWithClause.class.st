"
I am a with clause
"
Class {
	#name : #FmxSQLWithClause,
	#superclass : #FmxSQLClause,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLWithClause class >> annotation [

	<FMClass: #WithClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLWithClause >> isWithClause [

	<generated>
	^ true
]
