"
I am a stored procedure. That is to say, a function that is defined inside the database.
"
Class {
	#name : #FmxSQLStoredProcedure,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTInvocable + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithReferences + FmxSQLBehaviouralEntity + FmxSQLTNamedEntity + FmxSQLTQueryContainer + FmxSQLTWithAccesses + FmxSQLTWithAlias + FmxSQLTWithColumnReference + FmxSQLTWithCursor + FmxSQLTWithCursorReference + FmxSQLTWithImmediateSource + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTInvocable classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithReferences classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLTNamedEntity classTrait + FmxSQLTQueryContainer classTrait + FmxSQLTWithAccesses classTrait + FmxSQLTWithAlias classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithCursor classTrait + FmxSQLTWithCursorReference classTrait + FmxSQLTWithImmediateSource classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#instVars : [
		'#checkConstraintsCalling => FMMany type: #FmxSQLCheckConstraint opposite: #storedProceduresCalled',
		'#returnType => FMOne type: #FmxSQLAbstractType opposite: #storedProceduresReturning'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLStoredProcedure class >> annotation [

	<FMClass: #StoredProcedure super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLStoredProcedure >> addCheckConstraintsCalling: anObject [
	<generated>
	^ self checkConstraintsCalling add: anObject
]

{ #category : #accessing }
FmxSQLStoredProcedure >> checkConstraintsCalling [
	"Relation named: #checkConstraintsCalling type: #FmxSQLCheckConstraint opposite: #storedProceduresCalled"

	<generated>
	^ checkConstraintsCalling
]

{ #category : #accessing }
FmxSQLStoredProcedure >> checkConstraintsCalling: anObject [

	<generated>
	checkConstraintsCalling value: anObject
]

{ #category : #testing }
FmxSQLStoredProcedure >> isStoredProcedure [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLStoredProcedure >> returnType [
	"Relation named: #returnType type: #FmxSQLAbstractType opposite: #storedProceduresReturning"

	<generated>
	^ returnType
]

{ #category : #accessing }
FmxSQLStoredProcedure >> returnType: anObject [

	<generated>
	returnType := anObject
]
