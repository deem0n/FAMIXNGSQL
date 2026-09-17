"
I am an DELETE query.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedTablesDefined` | `FmxSQLTDefiningDerivedTables` | `parentQuery` | `FmxSQLDerivedTable` | |



"
Class {
	#name : 'FmxSQLDeleteQuery',
	#superclass : 'FmxSQLCRUDQuery',
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLDeleteQuery class >> annotation [

	<ignoreForCoverage>
	<FMClass: #DeleteQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
]
