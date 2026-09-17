"
I represent a Table in the relational model.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLColumnsContainer` | `columnsContainer` | `FmxSQLTColumn` | |
| `constraints` | `FmxSQLTable` | `table` | `FmxSQLConstraint` | |
| `triggers` | `FmxSQLTWithTriggers` | `table` | `FmxSQLTrigger` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLTable` | `table` | `FmxSQLTableReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `cursorParameters` | `FmxSQLAbstractType` | `type` | `FmxSQLCursorParameter` | |
| `localVariables` | `FmxSQLAbstractType` | `type` | `FmxSQLLocalVariable` | |
| `parameters` | `FmxSQLAbstractType` | `type` | `FmxSQLParameter` | |
| `storedProceduresReturning` | `FmxSQLAbstractType` | `returnType` | `FmxSQLStoredProcedure` | |
| `subTables` | `FmxSQLTable` | `superTable` | `FmxSQLTable` | |
| `superTable` | `FmxSQLTable` | `subTables` | `FmxSQLTable` | |
| `updateQueries` | `FmxSQLTable` | `table` | `FmxSQLUpdateQuery` | |



"
Class {
	#name : 'FmxSQLTable',
	#superclass : 'FmxSQLStructuralEntity',
	#traits : 'FmxSQLAbstractType + FmxSQLColumnsContainer + FmxSQLTWithTriggers',
	#classTraits : 'FmxSQLAbstractType classTrait + FmxSQLColumnsContainer classTrait + FmxSQLTWithTriggers classTrait',
	#instVars : [
		'#constraints => FMMany type: #FmxSQLConstraint opposite: #table',
		'#references => FMMany type: #FmxSQLTableReference opposite: #table',
		'#subTables => FMMany type: #FmxSQLTable opposite: #superTable',
		'#superTable => FMOne type: #FmxSQLTable opposite: #subTables',
		'#updateQueries => FMMany type: #FmxSQLUpdateQuery opposite: #table'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLTable class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Table super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTable >> addConstraint: anObject [

	<ignoreForCoverage>
	<generated>
	^ self constraints add: anObject
]

{ #category : 'adding' }
FmxSQLTable >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'adding' }
FmxSQLTable >> addSubTable: anObject [

	<ignoreForCoverage>
	<generated>
	^ self subTables add: anObject
]

{ #category : 'adding' }
FmxSQLTable >> addUpdateQuery: anObject [

	<ignoreForCoverage>
	<generated>
	^ self updateQueries add: anObject
]

{ #category : 'accessing' }
FmxSQLTable >> constraints [
	"Relation named: #constraints type: #FmxSQLConstraint opposite: #table"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ constraints
]

{ #category : 'accessing' }
FmxSQLTable >> constraints: anObject [

	<ignoreForCoverage>
	<generated>
	constraints value: anObject
]

{ #category : 'accessing' }
FmxSQLTable >> references [
	"Relation named: #references type: #FmxSQLTableReference opposite: #table"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLTable >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]

{ #category : 'accessing' }
FmxSQLTable >> subTables [
	"Relation named: #subTables type: #FmxSQLTable opposite: #superTable"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ subTables
]

{ #category : 'accessing' }
FmxSQLTable >> subTables: anObject [

	<ignoreForCoverage>
	<generated>
	subTables value: anObject
]

{ #category : 'accessing' }
FmxSQLTable >> superTable [
	"Relation named: #superTable type: #FmxSQLTable opposite: #subTables"

	<ignoreForCoverage>
	<generated>
	^ superTable
]

{ #category : 'accessing' }
FmxSQLTable >> superTable: anObject [

	<ignoreForCoverage>
	<generated>
	superTable := anObject
]

{ #category : 'accessing' }
FmxSQLTable >> updateQueries [
	"Relation named: #updateQueries type: #FmxSQLUpdateQuery opposite: #table"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ updateQueries
]

{ #category : 'accessing' }
FmxSQLTable >> updateQueries: anObject [

	<ignoreForCoverage>
	<generated>
	updateQueries value: anObject
]
