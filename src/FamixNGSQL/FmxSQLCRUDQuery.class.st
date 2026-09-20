"
I am an abstract superclass for Create Read Update Delete (CRUD) queries.

The Create query is the INSERT query in SQL.

The Read query is the SELECT query in SQL.

The Update query is the UPDATE query in SQL.

The Delete query is the DELETE query in SQL.

My subclasses represent these four queries.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `container` | `FmxSQLCRUDQuery` | `queries` | `FmxSQLTQueryContainer` | |
| `derivedTableDefining` | `FmxSQLCRUDQuery` | `sqlQuery` | `FmxSQLDerivedTable` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `clauses` | `FmxSQLCRUDQuery` | `sqlQuery` | `FmxSQLClause` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |
| `outgoingViewReferences` | `FmxSQLTWithViewReference` | `source` | `FmxSQLViewReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | `source` | `FmxSQLNamespaceReference` | |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FmxSQLCRUDQuery',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTSourceEntity + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#clauses => FMMany type: #FmxSQLClause opposite: #sqlQuery',
		'#container => FMOne type: #FmxSQLTQueryContainer opposite: #queries',
		'#derivedTableDefining => FMOne type: #FmxSQLDerivedTable opposite: #sqlQuery'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLCRUDQuery class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CRUDQuery super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLCRUDQuery >> addClause: anObject [

	<ignoreForCoverage>
	<generated>
	^ self clauses add: anObject
]

{ #category : 'accessing' }
FmxSQLCRUDQuery >> clauses [
	"Relation named: #clauses type: #FmxSQLClause opposite: #sqlQuery"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ clauses
]

{ #category : 'accessing' }
FmxSQLCRUDQuery >> clauses: anObject [

	<ignoreForCoverage>
	<generated>
	clauses value: anObject
]

{ #category : 'accessing' }
FmxSQLCRUDQuery >> container [
	"Relation named: #container type: #FmxSQLTQueryContainer opposite: #queries"

	<ignoreForCoverage>
	<generated>
	<container>
	^ container
]

{ #category : 'accessing' }
FmxSQLCRUDQuery >> container: anObject [

	<ignoreForCoverage>
	<generated>
	container := anObject
]

{ #category : 'accessing' }
FmxSQLCRUDQuery >> derivedTableDefining [
	"Relation named: #derivedTableDefining type: #FmxSQLDerivedTable opposite: #sqlQuery"

	<ignoreForCoverage>
	<generated>
	<container>
	^ derivedTableDefining
]

{ #category : 'accessing' }
FmxSQLCRUDQuery >> derivedTableDefining: anObject [

	<ignoreForCoverage>
	<generated>
	derivedTableDefining := anObject
]
