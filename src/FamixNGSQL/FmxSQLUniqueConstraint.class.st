"
I represent a UNIQUE constraint as defined in SQL standard.


"
Class {
	#name : 'FmxSQLUniqueConstraint',
	#superclass : 'FmxSQLConstraint',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLUniqueConstraint class >> annotation [

	<ignoreForCoverage>
	<FMClass: #UniqueConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLUniqueConstraint >> isUniqueConstraint [

	<ignoreForCoverage>
	<generated>
	^ true
]
