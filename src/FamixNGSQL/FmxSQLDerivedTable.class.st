"
I am a derived table. A derived table is a temporary table created to store temporarily the results of a sub-select query in a select query. Such tables are not globally named as a Tableor a View because they can not be accessed outside the query in which they are computed (which is also the query defining them). Nonetheless, they can get an alias to be referenced inside the query. .

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentQuery` | `FmxSQLDerivedTable` | `derivedTablesDefined` | `FmxSQLTDefiningDerivedTables` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLColumnsContainer` | `columnsContainer` | `FmxSQLTColumn` | |
| `queries` | `FmxSQLTQueryContainer` | `container` | `FmxSQLCRUDQuery` | |
| `query` | `FmxSQLDerivedTable` | `derivedTableDefining` | `FmxSQLCRUDQuery` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLDerivedTable` | `derivedTable` | `FmxSQLDerivedTableReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `anchorsOnIntervalsOfCode` | `FmxSQLTWithEntitySourceAnchor` | `entity` | `FmxSQLEntitySourceAnchor` | |



"
Class {
	#name : 'FmxSQLDerivedTable',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FmxSQLBehaviouralEntity + FmxSQLColumnsContainer + FmxSQLTQueryContainer',
	#classTraits : 'FmxSQLBehaviouralEntity classTrait + FmxSQLColumnsContainer classTrait + FmxSQLTQueryContainer classTrait',
	#instVars : [
		'#parentQuery => FMOne type: #FmxSQLTDefiningDerivedTables opposite: #derivedTablesDefined',
		'#query => FMOne type: #FmxSQLCRUDQuery opposite: #derivedTableDefining',
		'#references => FMMany type: #FmxSQLDerivedTableReference opposite: #derivedTable'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLDerivedTable class >> annotation [

	<ignoreForCoverage>
	<FMClass: #DerivedTable super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLDerivedTable >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'accessing' }
FmxSQLDerivedTable >> parentQuery [
	"Relation named: #parentQuery type: #FmxSQLTDefiningDerivedTables opposite: #derivedTablesDefined"

	<ignoreForCoverage>
	<generated>
	<container>
	^ parentQuery
]

{ #category : 'accessing' }
FmxSQLDerivedTable >> parentQuery: anObject [

	<ignoreForCoverage>
	<generated>
	parentQuery := anObject
]

{ #category : 'accessing' }
FmxSQLDerivedTable >> query [
	"Relation named: #query type: #FmxSQLCRUDQuery opposite: #derivedTableDefining"

	<ignoreForCoverage>
	<generated>
	^ query
]

{ #category : 'accessing' }
FmxSQLDerivedTable >> query: anObject [

	<ignoreForCoverage>
	<generated>
	query := anObject
]

{ #category : 'accessing' }
FmxSQLDerivedTable >> references [
	"Relation named: #references type: #FmxSQLDerivedTableReference opposite: #derivedTable"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLDerivedTable >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]
