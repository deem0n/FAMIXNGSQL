"
I am an abstract super class for behavioural entities that can contain queries in their source code.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `queries` | `FmxSQLTQueryContainer` | `container` | `FmxSQLCRUDQuery` | |



"
Trait {
	#name : 'FmxSQLTQueryContainer',
	#instVars : [
		'#queries => FMMany type: #FmxSQLCRUDQuery opposite: #container'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTQueryContainer classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TQueryContainer super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTQueryContainer >> addQuery: anObject [

	<ignoreForCoverage>
	<generated>
	^ self queries add: anObject
]

{ #category : 'testing' }
FmxSQLTQueryContainer >> isQueryContainer [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLTQueryContainer >> queries [
	"Relation named: #queries type: #FmxSQLCRUDQuery opposite: #container"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ queries
]

{ #category : 'accessing' }
FmxSQLTQueryContainer >> queries: anObject [

	<ignoreForCoverage>
	<generated>
	queries value: anObject
]
