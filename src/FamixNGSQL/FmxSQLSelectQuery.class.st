"
I am a SELECT query.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `viewDefining` | `FmxSQLSelectQuery` | `query` | `FmxSQLView` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedTablesDefined` | `FmxSQLTDefiningDerivedTables` | `parentQuery` | `FmxSQLDerivedTable` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `recordLocalVariables` | `FmxSQLSelectQuery` | `queryBoundTo` | `FmxSQLRecordLocalVariable` | |



"
Class {
	#name : 'FmxSQLSelectQuery',
	#superclass : 'FmxSQLCRUDQuery',
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#instVars : [
		'#recordLocalVariables => FMMany type: #FmxSQLRecordLocalVariable opposite: #queryBoundTo',
		'#viewDefining => FMOne type: #FmxSQLView opposite: #query'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLSelectQuery class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SelectQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLSelectQuery >> addRecordLocalVariable: anObject [

	<ignoreForCoverage>
	<generated>
	^ self recordLocalVariables add: anObject
]

{ #category : 'accessing' }
FmxSQLSelectQuery >> recordLocalVariables [
	"Relation named: #recordLocalVariables type: #FmxSQLRecordLocalVariable opposite: #queryBoundTo"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ recordLocalVariables
]

{ #category : 'accessing' }
FmxSQLSelectQuery >> recordLocalVariables: anObject [

	<ignoreForCoverage>
	<generated>
	recordLocalVariables value: anObject
]

{ #category : 'accessing' }
FmxSQLSelectQuery >> viewDefining [
	"Relation named: #viewDefining type: #FmxSQLView opposite: #query"

	<ignoreForCoverage>
	<generated>
	<container>
	<derived>
	^ viewDefining
]

{ #category : 'accessing' }
FmxSQLSelectQuery >> viewDefining: anObject [

	<ignoreForCoverage>
	<generated>
	viewDefining := anObject
]
