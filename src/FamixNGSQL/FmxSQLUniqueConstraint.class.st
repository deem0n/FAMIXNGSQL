"
I represent a UNIQUE constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLUniqueConstraint,
	#superclass : #FmxSQLConstraint,
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLUniqueConstraint class >> annotation [

	<FMClass: #UniqueConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLUniqueConstraint >> isUniqueConstraint [

	<generated>
	^ true
]
