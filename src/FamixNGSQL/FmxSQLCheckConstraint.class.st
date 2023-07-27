"
I represent a CHECK constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLCheckConstraint,
	#superclass : #FmxSQLConstraint,
	#traits : 'FmxSQLTWithImmediateSource',
	#classTraits : 'FmxSQLTWithImmediateSource classTrait',
	#instVars : [
		'#storedProceduresCalled => FMMany type: #FmxSQLStoredProcedure opposite: #checkConstraintsCalling'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCheckConstraint class >> annotation [

	<FMClass: #CheckConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLCheckConstraint >> addStoredProceduresCalled: anObject [
	<generated>
	^ self storedProceduresCalled add: anObject
]

{ #category : #testing }
FmxSQLCheckConstraint >> isCheckConstraint [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLCheckConstraint >> storedProceduresCalled [
	"Relation named: #storedProceduresCalled type: #FmxSQLStoredProcedure opposite: #checkConstraintsCalling"

	<generated>
	<derived>
	^ storedProceduresCalled
]

{ #category : #accessing }
FmxSQLCheckConstraint >> storedProceduresCalled: anObject [

	<generated>
	storedProceduresCalled value: anObject
]
