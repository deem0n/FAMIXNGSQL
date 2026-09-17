"
I am a local variable of a stored procedure. I have a type.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FamixTLocalVariable` | `localVariables` | `FamixTWithLocalVariables` | Behavioural entity declaring this local variable. belongsTo implementation|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FmxSQLLocalVariable` | `localVariable` | `FmxSQLLocalVariableAccess` | |
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `type` | `FmxSQLLocalVariable` | `localVariables` | `FmxSQLAbstractType` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FmxSQLLocalVariable',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FamixTAccessible + FamixTLocalVariable',
	#classTraits : 'FamixTAccessible classTrait + FamixTLocalVariable classTrait',
	#instVars : [
		'#accesses => FMMany type: #FmxSQLLocalVariableAccess opposite: #localVariable',
		'#type => FMOne type: #FmxSQLAbstractType opposite: #localVariables'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLLocalVariable class >> annotation [

	<ignoreForCoverage>
	<FMClass: #LocalVariable super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLLocalVariable >> accesses [
	"Relation named: #accesses type: #FmxSQLLocalVariableAccess opposite: #localVariable"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ accesses
]

{ #category : 'accessing' }
FmxSQLLocalVariable >> accesses: anObject [

	<ignoreForCoverage>
	<generated>
	accesses value: anObject
]

{ #category : 'adding' }
FmxSQLLocalVariable >> addAccess: anObject [

	<ignoreForCoverage>
	<generated>
	^ self accesses add: anObject
]

{ #category : 'accessing' }
FmxSQLLocalVariable >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #localVariables"

	<ignoreForCoverage>
	<generated>
	^ type
]

{ #category : 'accessing' }
FmxSQLLocalVariable >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
