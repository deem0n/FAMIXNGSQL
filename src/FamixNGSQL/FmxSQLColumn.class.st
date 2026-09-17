"
I represent a Column in the relational model.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columnsContainer` | `FmxSQLTColumn` | `columns` | `FmxSQLColumnsContainer` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLColumn` | `column` | `FmxSQLColumnReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `type` | `FmxSQLColumn` | `columns` | `FmxSQLType` | |



"
Class {
	#name : 'FmxSQLColumn',
	#superclass : 'FmxSQLStructuralEntity',
	#traits : 'FmxSQLTColumn',
	#classTraits : 'FmxSQLTColumn classTrait',
	#instVars : [
		'#references => FMMany type: #FmxSQLColumnReference opposite: #column',
		'#type => FMOne type: #FmxSQLType opposite: #columns'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLColumn class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Column super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLColumn >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'testing' }
FmxSQLColumn >> isColumn [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLColumn >> references [
	"Relation named: #references type: #FmxSQLColumnReference opposite: #column"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLColumn >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]

{ #category : 'accessing' }
FmxSQLColumn >> type [
	"Relation named: #type type: #FmxSQLType opposite: #columns"

	<ignoreForCoverage>
	<generated>
	^ type
]

{ #category : 'accessing' }
FmxSQLColumn >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
