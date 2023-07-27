"
I am an access to a stored procedure parameter.
"
Class {
	#name : #FmxSQLParameterAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLParameterAccess class >> annotation [

	<FMClass: #ParameterAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLParameterAccess >> isParameterAccess [

	<generated>
	^ true
]
