"
I am an abstract clause

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sqlQuery` | `FmxSQLClause` | `clauses` | `FmxSQLCRUDQuery` | |

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
		'#sqlQuery => FMOne type: #FmxSQLCRUDQuery opposite: #clauses'
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
FmxSQLClause >> sqlQuery [
	"Relation named: #sqlQuery type: #FmxSQLCRUDQuery opposite: #clauses"

	<ignoreForCoverage>
	<generated>
	<container>
	^ sqlQuery
]

{ #category : 'accessing' }
FmxSQLClause >> sqlQuery: anObject [

	<ignoreForCoverage>
	<generated>
	sqlQuery := anObject
]
