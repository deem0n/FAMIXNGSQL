"
I represent a Type in the database. I can be used for a column, a local variable, a parameter, etc...

## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLType` | `type` | `FmxSQLTypeReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLType` | `type` | `FmxSQLColumn` | |
| `cursorParameters` | `FmxSQLAbstractType` | `type` | `FmxSQLCursorParameter` | |
| `localVariables` | `FmxSQLAbstractType` | `type` | `FmxSQLLocalVariable` | |
| `parameters` | `FmxSQLAbstractType` | `type` | `FmxSQLParameter` | |
| `storedProceduresReturning` | `FmxSQLAbstractType` | `returnType` | `FmxSQLStoredProcedure` | |



"
Class {
	#name : 'FmxSQLType',
	#superclass : 'FmxSQLStructuralEntity',
	#traits : 'FmxSQLAbstractType',
	#classTraits : 'FmxSQLAbstractType classTrait',
	#instVars : [
		'#columns => FMMany type: #FmxSQLColumn opposite: #type',
		'#references => FMMany type: #FmxSQLTypeReference opposite: #type'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLType class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Type super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLType >> addColumn: anObject [

	<ignoreForCoverage>
	<generated>
	^ self columns add: anObject
]

{ #category : 'adding' }
FmxSQLType >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'accessing' }
FmxSQLType >> columns [
	"Relation named: #columns type: #FmxSQLColumn opposite: #type"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ columns
]

{ #category : 'accessing' }
FmxSQLType >> columns: anObject [

	<ignoreForCoverage>
	<generated>
	columns value: anObject
]

{ #category : 'accessing' }
FmxSQLType >> references [
	"Relation named: #references type: #FmxSQLTypeReference opposite: #type"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLType >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]
