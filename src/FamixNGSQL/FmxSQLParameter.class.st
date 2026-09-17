"
I am a parameter of a stored procedure. I have a type.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FamixTParameter` | `parameters` | `FamixTWithParameters` | Behavioural entity containing this parameter. belongsTo implementation|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `type` | `FmxSQLParameter` | `parameters` | `FmxSQLAbstractType` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `mode` | `String` | nil | |
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `position` | `Number` | nil | |

"
Class {
	#name : 'FmxSQLParameter',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FamixTAccessible + FamixTParameter',
	#classTraits : 'FamixTAccessible classTrait + FamixTParameter classTrait',
	#instVars : [
		'#mode => FMProperty',
		'#position => FMProperty',
		'#type => FMOne type: #FmxSQLAbstractType opposite: #parameters'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLParameter class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Parameter super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLParameter >> mode [

	<FMProperty: #mode type: #String>
	<ignoreForCoverage>
	<generated>
	^ mode
]

{ #category : 'accessing' }
FmxSQLParameter >> mode: anObject [
	<ignoreForCoverage>
	<generated>
	mode := anObject
]

{ #category : 'accessing' }
FmxSQLParameter >> position [

	<FMProperty: #position type: #Number>
	<ignoreForCoverage>
	<generated>
	^ position
]

{ #category : 'accessing' }
FmxSQLParameter >> position: anObject [
	<ignoreForCoverage>
	<generated>
	position := anObject
]

{ #category : 'accessing' }
FmxSQLParameter >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #parameters"

	<ignoreForCoverage>
	<generated>
	^ type
]

{ #category : 'accessing' }
FmxSQLParameter >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
