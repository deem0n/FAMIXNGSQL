"
I am a local variable of a stored procedure. I have a type.
"
Class {
	#name : #FmxSQLLocalVariable,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FamixTLocalVariable',
	#classTraits : 'FamixTAccessible classTrait + FamixTLocalVariable classTrait',
	#instVars : [
		'#type => FMOne type: #FmxSQLAbstractType opposite: #localVariables',
		'#accesses => FMMany type: #FmxSQLLocalVariableAccess opposite: #localVariable'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLLocalVariable class >> annotation [

	<FMClass: #LocalVariable super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLLocalVariable >> accesses [
	"Relation named: #accesses type: #FmxSQLLocalVariableAccess opposite: #localVariable"

	<generated>
	<derived>
	^ accesses
]

{ #category : #accessing }
FmxSQLLocalVariable >> accesses: anObject [

	<generated>
	accesses value: anObject
]

{ #category : #adding }
FmxSQLLocalVariable >> addAccess: anObject [
	<generated>
	^ self accesses add: anObject
]

{ #category : #accessing }
FmxSQLLocalVariable >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #localVariables"

	<generated>
	^ type
]

{ #category : #accessing }
FmxSQLLocalVariable >> type: anObject [

	<generated>
	type := anObject
]
