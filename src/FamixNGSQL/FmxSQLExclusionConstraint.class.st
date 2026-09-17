"
I represent an EXCLUSION constraint as defined in SQL standard.

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|
| `storedProceduresCalled` | `FmxSQLExclusionConstraint` | `exclusionConstraintsCalling` | `FmxSQLStoredProcedure` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `source` | `String` | nil | Actual source code of the source entity|

"
Class {
	#name : 'FmxSQLExclusionConstraint',
	#superclass : 'FmxSQLConstraint',
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#instVars : [
		'#storedProceduresCalled => FMMany type: #FmxSQLStoredProcedure opposite: #exclusionConstraintsCalling'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLExclusionConstraint class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ExclusionConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLExclusionConstraint >> addStoredProceduresCalled: anObject [

	<ignoreForCoverage>
	<generated>
	^ self storedProceduresCalled add: anObject
]

{ #category : 'testing' }
FmxSQLExclusionConstraint >> isExclusionConstraint [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLExclusionConstraint >> storedProceduresCalled [
	"Relation named: #storedProceduresCalled type: #FmxSQLStoredProcedure opposite: #exclusionConstraintsCalling"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ storedProceduresCalled
]

{ #category : 'accessing' }
FmxSQLExclusionConstraint >> storedProceduresCalled: anObject [

	<ignoreForCoverage>
	<generated>
	storedProceduresCalled value: anObject
]
