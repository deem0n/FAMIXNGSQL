"
I represent a PRIMARY KEY constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLPrimaryKeyConstraint,
	#superclass : #FmxSQLConstraint,
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLPrimaryKeyConstraint class >> annotation [

	<FMClass: #PrimaryKeyConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLPrimaryKeyConstraint >> isPrimaryKeyConstraint [

	<generated>
	^ true
]
