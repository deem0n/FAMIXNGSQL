"
I am a special stored procedure used to define the actions a trigger perform.

This concept does not exists in all DBMS (for example, in MySQL a trigger has a body directly defined when defining the trigger). Nevertheless, it allows to unify the different approach take by different DBMS. In the meta-model, a trigger is always defined as referencing a trigger stored procedure. For DBMS where it is not implemented like that in reality, the trigger stored procedure as no name because it is virtual.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columnsReferenced` | `FmxSQLTriggerStoredProcedure` | `triggerStoredProceduresReferencing` | `FmxSQLColumnReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `triggers` | `FmxSQLTriggerStoredProcedure` | `storedProcedure` | `FmxSQLTrigger` | |



"
Class {
	#name : 'FmxSQLTriggerStoredProcedure',
	#superclass : 'FmxSQLStoredProcedure',
	#instVars : [
		'#columnsReferenced => FMMany type: #FmxSQLColumnReference opposite: #triggerStoredProceduresReferencing',
		'#triggers => FMMany type: #FmxSQLTrigger opposite: #storedProcedure'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLTriggerStoredProcedure class >> annotation [

	<ignoreForCoverage>
	<FMClass: #TriggerStoredProcedure super: #FmxSQLStoredProcedure>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTriggerStoredProcedure >> addColumnsReferenced: anObject [

	<ignoreForCoverage>
	<generated>
	^ self columnsReferenced add: anObject
]

{ #category : 'adding' }
FmxSQLTriggerStoredProcedure >> addTrigger: anObject [

	<ignoreForCoverage>
	<generated>
	^ self triggers add: anObject
]

{ #category : 'accessing' }
FmxSQLTriggerStoredProcedure >> columnsReferenced [
	"Relation named: #columnsReferenced type: #FmxSQLColumnReference opposite: #triggerStoredProceduresReferencing"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ columnsReferenced
]

{ #category : 'accessing' }
FmxSQLTriggerStoredProcedure >> columnsReferenced: anObject [

	<ignoreForCoverage>
	<generated>
	columnsReferenced value: anObject
]

{ #category : 'testing' }
FmxSQLTriggerStoredProcedure >> isTriggerStoredProcedure [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLTriggerStoredProcedure >> triggers [
	"Relation named: #triggers type: #FmxSQLTrigger opposite: #storedProcedure"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ triggers
]

{ #category : 'accessing' }
FmxSQLTriggerStoredProcedure >> triggers: anObject [

	<ignoreForCoverage>
	<generated>
	triggers value: anObject
]
