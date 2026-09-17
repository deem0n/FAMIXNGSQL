"
I am an abstract clause

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `query` | `FmxSQLClause` | `clauses` | `FmxSQLCRUDQuery` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `aliases` | `FmxSQLTWithAlias` | `parentBehaviouralEntity` | `FmxSQLAlias` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FmxSQLClause',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTSourceEntity + FmxSQLTWithAlias + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + FmxSQLTWithAlias classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#query => FMOne type: #FmxSQLCRUDQuery opposite: #clauses'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLClause class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Clause super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLClause >> query [
	"Relation named: #query type: #FmxSQLCRUDQuery opposite: #clauses"

	<ignoreForCoverage>
	<generated>
	<container>
	^ query
]

{ #category : 'accessing' }
FmxSQLClause >> query: anObject [

	<ignoreForCoverage>
	<generated>
	query := anObject
]
