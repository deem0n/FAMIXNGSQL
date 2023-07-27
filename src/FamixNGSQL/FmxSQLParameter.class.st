"
I am a parameter of a stored procedure. I have a type.
"
Class {
	#name : #FmxSQLParameter,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FamixTParameter',
	#classTraits : 'FamixTAccessible classTrait + FamixTParameter classTrait',
	#instVars : [
		'#type => FMOne type: #FmxSQLAbstractType opposite: #parameters'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLParameter class >> annotation [

	<FMClass: #Parameter super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLParameter >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #parameters"

	<generated>
	^ type
]

{ #category : #accessing }
FmxSQLParameter >> type: anObject [

	<generated>
	type := anObject
]
