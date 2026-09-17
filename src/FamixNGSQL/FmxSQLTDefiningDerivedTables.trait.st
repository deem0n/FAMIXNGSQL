"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedTablesDefined` | `FmxSQLTDefiningDerivedTables` | `parentQuery` | `FmxSQLDerivedTable` | |



"
Trait {
	#name : 'FmxSQLTDefiningDerivedTables',
	#instVars : [
		'#derivedTablesDefined => FMMany type: #FmxSQLDerivedTable opposite: #parentQuery'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTDefiningDerivedTables classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TDefiningDerivedTables super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTDefiningDerivedTables >> addDerivedTablesDefined: anObject [

	<ignoreForCoverage>
	<generated>
	^ self derivedTablesDefined add: anObject
]

{ #category : 'accessing' }
FmxSQLTDefiningDerivedTables >> derivedTablesDefined [
	"Relation named: #derivedTablesDefined type: #FmxSQLDerivedTable opposite: #parentQuery"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ derivedTablesDefined
]

{ #category : 'accessing' }
FmxSQLTDefiningDerivedTables >> derivedTablesDefined: anObject [

	<ignoreForCoverage>
	<generated>
	derivedTablesDefined value: anObject
]
