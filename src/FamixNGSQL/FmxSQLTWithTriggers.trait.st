"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `triggers` | `FmxSQLTWithTriggers` | `table` | `FmxSQLTrigger` | |



"
Trait {
	#name : 'FmxSQLTWithTriggers',
	#instVars : [
		'#triggers => FMMany type: #FmxSQLTrigger opposite: #table'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithTriggers classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithTriggers super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithTriggers >> addTrigger: anObject [

	<ignoreForCoverage>
	<generated>
	^ self triggers add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithTriggers >> triggers [
	"Relation named: #triggers type: #FmxSQLTrigger opposite: #table"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ triggers
]

{ #category : 'accessing' }
FmxSQLTWithTriggers >> triggers: anObject [

	<ignoreForCoverage>
	<generated>
	triggers value: anObject
]
