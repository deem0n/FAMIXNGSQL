"
I represent a PRIMARY KEY constraint as defined in SQL standard.


"
Class {
	#name : 'FmxSQLPrimaryKeyConstraint',
	#superclass : 'FmxSQLConstraint',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLPrimaryKeyConstraint class >> annotation [

	<ignoreForCoverage>
	<FMClass: #PrimaryKeyConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLPrimaryKeyConstraint >> isPrimaryKeyConstraint [

	<ignoreForCoverage>
	<generated>
	^ true
]
