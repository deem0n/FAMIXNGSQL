"
I am a cursor parameter
"
Class {
	#name : #FmxSQLCursorParameter,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FamixTParameter',
	#classTraits : 'FamixTAccessible classTrait + FamixTParameter classTrait',
	#instVars : [
		'#type => FMOne type: #FmxSQLAbstractType opposite: #cursorParameters'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCursorParameter class >> annotation [

	<FMClass: #CursorParameter super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLCursorParameter >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #cursorParameters"

	<generated>
	^ type
]

{ #category : #accessing }
FmxSQLCursorParameter >> type: anObject [

	<generated>
	type := anObject
]
