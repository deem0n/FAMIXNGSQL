"
I am a source anchor which anchor source code held by an entity with immediate source.

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|
| `entity` | `FmxSQLEntitySourceAnchor` | `anchorsOnIntervalsOfCode` | `FmxSQLTWithEntitySourceAnchor` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `end` | `Number` | nil | |
| `start` | `Number` | nil | |

"
Class {
	#name : 'FmxSQLEntitySourceAnchor',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#instVars : [
		'#end => FMProperty',
		'#entity => FMOne type: #FmxSQLTWithEntitySourceAnchor opposite: #anchorsOnIntervalsOfCode',
		'#start => FMProperty'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLEntitySourceAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #EntitySourceAnchor super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLEntitySourceAnchor >> end [

	<FMProperty: #end type: #Number>
	<ignoreForCoverage>
	<generated>
	^ end
]

{ #category : 'accessing' }
FmxSQLEntitySourceAnchor >> end: anObject [
	<ignoreForCoverage>
	<generated>
	end := anObject
]

{ #category : 'accessing' }
FmxSQLEntitySourceAnchor >> entity [
	"Relation named: #entity type: #FmxSQLTWithEntitySourceAnchor opposite: #anchorsOnIntervalsOfCode"

	<ignoreForCoverage>
	<generated>
	^ entity
]

{ #category : 'accessing' }
FmxSQLEntitySourceAnchor >> entity: anObject [

	<ignoreForCoverage>
	<generated>
	entity := anObject
]

{ #category : 'testing' }
FmxSQLEntitySourceAnchor >> isEntitySourceAnchor [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLEntitySourceAnchor >> start [

	<FMProperty: #start type: #Number>
	<ignoreForCoverage>
	<generated>
	^ start
]

{ #category : 'accessing' }
FmxSQLEntitySourceAnchor >> start: anObject [
	<ignoreForCoverage>
	<generated>
	start := anObject
]
