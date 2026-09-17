"
I represent a NOT NULL constraint as defined in SQL standard.


"
Class {
	#name : 'FmxSQLNotNullConstraint',
	#superclass : 'FmxSQLConstraint',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLNotNullConstraint class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NotNullConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLNotNullConstraint >> isNotNullConstraint [

	<ignoreForCoverage>
	<generated>
	^ true
]
