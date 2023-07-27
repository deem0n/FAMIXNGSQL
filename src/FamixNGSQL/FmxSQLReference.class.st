"
I am an abstract object that represent a reference made to another entity in the source code a behavioural entity.
"
Class {
	#name : #FmxSQLReference,
	#superclass : #FmxSQLAssociation,
	#traits : 'FmxSQLTArgument',
	#classTraits : 'FmxSQLTArgument classTrait',
	#instVars : [
		'#belongsToGroup => FMOne type: #FmxSQLReferencesGroup opposite: #references',
		'#storedProcedureContainer => FMOne type: #FmxSQLStoredProcedureCall opposite: #arguments'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLReference class >> annotation [

	<FMClass: #Reference super: #FmxSQLAssociation>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLReference >> belongsToGroup [
	"Relation named: #belongsToGroup type: #FmxSQLReferencesGroup opposite: #references"

	<generated>
	<container>
	^ belongsToGroup
]

{ #category : #accessing }
FmxSQLReference >> belongsToGroup: anObject [

	<generated>
	belongsToGroup := anObject
]

{ #category : #navigation }
FmxSQLReference >> belongsToGroupGroup [
	<generated>
	<navigation: 'BelongsToGroup'>
	^ MooseSpecializedGroup with: self belongsToGroup
]

{ #category : #accessing }
FmxSQLReference >> storedProcedureContainer [
	"Relation named: #storedProcedureContainer type: #FmxSQLStoredProcedureCall opposite: #arguments"

	<generated>
	<container>
	^ storedProcedureContainer
]

{ #category : #accessing }
FmxSQLReference >> storedProcedureContainer: anObject [

	<generated>
	storedProcedureContainer := anObject
]

{ #category : #navigation }
FmxSQLReference >> storedProcedureContainerGroup [
	<generated>
	<navigation: 'StoredProcedureContainer'>
	^ MooseSpecializedGroup with: self storedProcedureContainer
]
