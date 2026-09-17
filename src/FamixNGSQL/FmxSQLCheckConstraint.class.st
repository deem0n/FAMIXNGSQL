"
I represent a CHECK constraint as defined in SQL standard.

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|
| `storedProceduresCalled` | `FmxSQLCheckConstraint` | `checkConstraintsCalling` | `FmxSQLStoredProcedure` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `source` | `String` | nil | Actual source code of the source entity|

"
Class {
	#name : 'FmxSQLCheckConstraint',
	#superclass : 'FmxSQLConstraint',
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#instVars : [
		'#storedProceduresCalled => FMMany type: #FmxSQLStoredProcedure opposite: #checkConstraintsCalling'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLCheckConstraint class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CheckConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLCheckConstraint >> addStoredProceduresCalled: anObject [

	<ignoreForCoverage>
	<generated>
	^ self storedProceduresCalled add: anObject
]

{ #category : 'testing' }
FmxSQLCheckConstraint >> isCheckConstraint [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLCheckConstraint >> storedProceduresCalled [
	"Relation named: #storedProceduresCalled type: #FmxSQLStoredProcedure opposite: #checkConstraintsCalling"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ storedProceduresCalled
]

{ #category : 'accessing' }
FmxSQLCheckConstraint >> storedProceduresCalled: anObject [

	<ignoreForCoverage>
	<generated>
	storedProceduresCalled value: anObject
]
