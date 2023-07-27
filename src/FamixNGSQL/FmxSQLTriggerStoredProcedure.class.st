"
I am a special stored procedure used to define the actions a trigger perform.

This concept does not exists in all DBMS (for example, in MySQL a trigger has a body directly defined when defining the trigger). Nevertheless, it allows to unify the different approach take by different DBMS. In the meta-model, a trigger is always defined as referencing a trigger stored procedure. For DBMS where it is not implemented like that in reality, the trigger stored procedure as no name because it is virtual.
"
Class {
	#name : #FmxSQLTriggerStoredProcedure,
	#superclass : #FmxSQLStoredProcedure,
	#instVars : [
		'#columnsReferenced => FMMany type: #FmxSQLColumnReference opposite: #triggerStoredProceduresReferencing',
		'#triggers => FMMany type: #FmxSQLTrigger opposite: #storedProcedure'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLTriggerStoredProcedure class >> annotation [

	<FMClass: #TriggerStoredProcedure super: #FmxSQLStoredProcedure>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTriggerStoredProcedure >> addColumnsReferenced: anObject [
	<generated>
	^ self columnsReferenced add: anObject
]

{ #category : #adding }
FmxSQLTriggerStoredProcedure >> addTrigger: anObject [
	<generated>
	^ self triggers add: anObject
]

{ #category : #accessing }
FmxSQLTriggerStoredProcedure >> columnsReferenced [
	"Relation named: #columnsReferenced type: #FmxSQLColumnReference opposite: #triggerStoredProceduresReferencing"

	<generated>
	<derived>
	^ columnsReferenced
]

{ #category : #accessing }
FmxSQLTriggerStoredProcedure >> columnsReferenced: anObject [

	<generated>
	columnsReferenced value: anObject
]

{ #category : #navigation }
FmxSQLTriggerStoredProcedure >> columnsReferencedGroup [
	<generated>
	<navigation: 'ColumnsReferenced'>
	^ MooseSpecializedGroup withAll: self columnsReferenced asSet
]

{ #category : #testing }
FmxSQLTriggerStoredProcedure >> isTriggerStoredProcedure [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLTriggerStoredProcedure >> triggers [
	"Relation named: #triggers type: #FmxSQLTrigger opposite: #storedProcedure"

	<generated>
	<derived>
	^ triggers
]

{ #category : #accessing }
FmxSQLTriggerStoredProcedure >> triggers: anObject [

	<generated>
	triggers value: anObject
]
