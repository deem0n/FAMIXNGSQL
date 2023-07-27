"
I am a trigger. A trigger allows to define actions to performs when a specific event occurs on a table. Because a trigger can not exist without the table to which it listens to events, a trigger is contained in a table.
"
Class {
	#name : #FmxSQLTrigger,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FmxSQLBehaviouralEntity + FmxSQLTNamedEntity',
	#classTraits : 'FmxSQLBehaviouralEntity classTrait + FmxSQLTNamedEntity classTrait',
	#instVars : [
		'#firingAction => FMProperty',
		'#when => FMProperty',
		'#storedProcedure => FMOne type: #FmxSQLTriggerStoredProcedure opposite: #triggers',
		'#table => FMOne type: #FmxSQLTable opposite: #triggers'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLTrigger class >> annotation [

	<FMClass: #Trigger super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTrigger >> firingAction [

	<FMProperty: #firingAction type: #String>
	<generated>
	^ firingAction
]

{ #category : #accessing }
FmxSQLTrigger >> firingAction: anObject [
	<generated>
	firingAction := anObject
]

{ #category : #accessing }
FmxSQLTrigger >> storedProcedure [
	"Relation named: #storedProcedure type: #FmxSQLTriggerStoredProcedure opposite: #triggers"

	<generated>
	^ storedProcedure
]

{ #category : #accessing }
FmxSQLTrigger >> storedProcedure: anObject [

	<generated>
	storedProcedure := anObject
]

{ #category : #accessing }
FmxSQLTrigger >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #triggers"

	<generated>
	<container>
	^ table
]

{ #category : #accessing }
FmxSQLTrigger >> table: anObject [

	<generated>
	table := anObject
]

{ #category : #navigation }
FmxSQLTrigger >> tableGroup [
	<generated>
	<navigation: 'Table'>
	^ MooseSpecializedGroup with: self table
]

{ #category : #accessing }
FmxSQLTrigger >> when [

	<FMProperty: #when type: #String>
	<generated>
	^ when
]

{ #category : #accessing }
FmxSQLTrigger >> when: anObject [
	<generated>
	when := anObject
]
