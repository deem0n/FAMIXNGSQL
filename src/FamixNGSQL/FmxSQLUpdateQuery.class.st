"
I am an UPDATE query.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedTablesDefined` | `FmxSQLTDefiningDerivedTables` | `parentQuery` | `FmxSQLDerivedTable` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `table` | `FmxSQLUpdateQuery` | `updateQueries` | `FmxSQLTable` | |



"
Class {
	#name : 'FmxSQLUpdateQuery',
	#superclass : 'FmxSQLCRUDQuery',
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#instVars : [
		'#table => FMOne type: #FmxSQLTable opposite: #updateQueries'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLUpdateQuery class >> annotation [

	<ignoreForCoverage>
	<FMClass: #UpdateQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLUpdateQuery >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #updateQueries"

	<ignoreForCoverage>
	<generated>
	^ table
]

{ #category : 'accessing' }
FmxSQLUpdateQuery >> table: anObject [

	<ignoreForCoverage>
	<generated>
	table := anObject
]
