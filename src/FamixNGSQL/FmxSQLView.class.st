"
I am a view. I can be used transparently as a table but I do not hold data. My data are fetched by the SELECT query which defines myself.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentNamespace` | `FmxSQLTNamedEntity` | `namespaceEntities` | `FmxSQLNamespace` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLColumnsContainer` | `columnsContainer` | `FmxSQLTColumn` | |
| `queries` | `FmxSQLTQueryContainer` | `container` | `FmxSQLCRUDQuery` | |
| `sqlQuery` | `FmxSQLView` | `viewDefining` | `FmxSQLSelectQuery` | |
| `triggers` | `FmxSQLTWithTriggers` | `table` | `FmxSQLTrigger` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLView` | `view` | `FmxSQLViewReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `anchorsOnIntervalsOfCode` | `FmxSQLTWithEntitySourceAnchor` | `entity` | `FmxSQLEntitySourceAnchor` | |
| `cursorParameters` | `FmxSQLAbstractType` | `type` | `FmxSQLCursorParameter` | |
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|
| `localVariables` | `FmxSQLAbstractType` | `type` | `FmxSQLLocalVariable` | |
| `parameters` | `FmxSQLAbstractType` | `type` | `FmxSQLParameter` | |
| `storedProceduresReturning` | `FmxSQLAbstractType` | `returnType` | `FmxSQLStoredProcedure` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isMaterialized` | `Boolean` | nil | |
| `source` | `String` | nil | Actual source code of the source entity|

"
Class {
	#name : 'FmxSQLView',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FamixTHasImmediateSource + FmxSQLAbstractType + FmxSQLBehaviouralEntity + FmxSQLColumnsContainer + FmxSQLTNamedEntity + FmxSQLTQueryContainer + FmxSQLTWithTriggers',
	#classTraits : 'FamixTHasImmediateSource classTrait + FmxSQLAbstractType classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLColumnsContainer classTrait + FmxSQLTNamedEntity classTrait + FmxSQLTQueryContainer classTrait + FmxSQLTWithTriggers classTrait',
	#instVars : [
		'#isMaterialized => FMProperty',
		'#sqlQuery => FMOne type: #FmxSQLSelectQuery opposite: #viewDefining',
		'#references => FMMany type: #FmxSQLViewReference opposite: #view'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLView class >> annotation [

	<ignoreForCoverage>
	<FMClass: #View super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLView >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'accessing' }
FmxSQLView >> isMaterialized [

	<FMProperty: #isMaterialized type: #Boolean>
	<ignoreForCoverage>
	<generated>
	^ isMaterialized
]

{ #category : 'accessing' }
FmxSQLView >> isMaterialized: anObject [
	<ignoreForCoverage>
	<generated>
	isMaterialized := anObject
]

{ #category : 'testing' }
FmxSQLView >> isView [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLView >> sqlQuery [
	"Relation named: #sqlQuery type: #FmxSQLSelectQuery opposite: #viewDefining"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ sqlQuery
]

{ #category : 'accessing' }
FmxSQLView >> sqlQuery: anObject [

	<ignoreForCoverage>
	<generated>
	sqlQuery := anObject
]

{ #category : 'accessing' }
FmxSQLView >> references [
	"Relation named: #references type: #FmxSQLViewReference opposite: #view"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLView >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]
