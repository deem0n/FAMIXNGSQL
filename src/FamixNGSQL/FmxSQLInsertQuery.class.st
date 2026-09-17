"
I am an INSERT query.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedTablesDefined` | `FmxSQLTDefiningDerivedTables` | `parentQuery` | `FmxSQLDerivedTable` | |



"
Class {
	#name : 'FmxSQLInsertQuery',
	#superclass : 'FmxSQLCRUDQuery',
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLInsertQuery class >> annotation [

	<ignoreForCoverage>
	<FMClass: #InsertQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
]
