"
I am a trigger. A trigger allows to define actions to performs when a specific event occurs on a table. Because a trigger can not exist without the table to which it listens to events, a trigger is contained in a table.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentNamespace` | `FmxSQLTNamedEntity` | `namespaceEntities` | `FmxSQLNamespace` | |
| `table` | `FmxSQLTrigger` | `triggers` | `FmxSQLTWithTriggers` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `anchorsOnIntervalsOfCode` | `FmxSQLTWithEntitySourceAnchor` | `entity` | `FmxSQLEntitySourceAnchor` | |
| `storedProcedure` | `FmxSQLTrigger` | `triggers` | `FmxSQLTriggerStoredProcedure` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `firingAction` | `String` | nil | |
| `when` | `String` | nil | |

"
Class {
	#name : 'FmxSQLTrigger',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FmxSQLBehaviouralEntity + FmxSQLTNamedEntity',
	#classTraits : 'FmxSQLBehaviouralEntity classTrait + FmxSQLTNamedEntity classTrait',
	#instVars : [
		'#firingAction => FMProperty',
		'#storedProcedure => FMOne type: #FmxSQLTriggerStoredProcedure opposite: #triggers',
		'#table => FMOne type: #FmxSQLTWithTriggers opposite: #triggers',
		'#when => FMProperty'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLTrigger class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Trigger super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLTrigger >> firingAction [

	<FMProperty: #firingAction type: #String>
	<ignoreForCoverage>
	<generated>
	^ firingAction
]

{ #category : 'accessing' }
FmxSQLTrigger >> firingAction: anObject [
	<ignoreForCoverage>
	<generated>
	firingAction := anObject
]

{ #category : 'accessing' }
FmxSQLTrigger >> storedProcedure [
	"Relation named: #storedProcedure type: #FmxSQLTriggerStoredProcedure opposite: #triggers"

	<ignoreForCoverage>
	<generated>
	^ storedProcedure
]

{ #category : 'accessing' }
FmxSQLTrigger >> storedProcedure: anObject [

	<ignoreForCoverage>
	<generated>
	storedProcedure := anObject
]

{ #category : 'accessing' }
FmxSQLTrigger >> table [
	"Relation named: #table type: #FmxSQLTWithTriggers opposite: #triggers"

	<ignoreForCoverage>
	<generated>
	<container>
	^ table
]

{ #category : 'accessing' }
FmxSQLTrigger >> table: anObject [

	<ignoreForCoverage>
	<generated>
	table := anObject
]

{ #category : 'accessing' }
FmxSQLTrigger >> when [

	<FMProperty: #when type: #String>
	<ignoreForCoverage>
	<generated>
	^ when
]

{ #category : 'accessing' }
FmxSQLTrigger >> when: anObject [
	<ignoreForCoverage>
	<generated>
	when := anObject
]
