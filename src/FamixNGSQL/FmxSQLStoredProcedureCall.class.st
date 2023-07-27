"
I am a call to a stored procedure of the model.
"
Class {
	#name : #FmxSQLStoredProcedureCall,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTInvocation + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTInvocation classTrait + FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#arguments => FMMany type: #FmxSQLReference opposite: #storedProcedureContainer'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLStoredProcedureCall class >> annotation [

	<FMClass: #StoredProcedureCall super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLStoredProcedureCall >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
FmxSQLStoredProcedureCall >> arguments [
	"Relation named: #arguments type: #FmxSQLReference opposite: #storedProcedureContainer"

	<generated>
	<derived>
	^ arguments
]

{ #category : #accessing }
FmxSQLStoredProcedureCall >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : #navigation }
FmxSQLStoredProcedureCall >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseSpecializedGroup withAll: self arguments asSet
]

{ #category : #testing }
FmxSQLStoredProcedureCall >> isStoredProcedureCall [

	<generated>
	^ true
]
