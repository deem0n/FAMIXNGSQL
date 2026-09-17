"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columnsContainer` | `FmxSQLTColumn` | `columns` | `FmxSQLColumnsContainer` | |



"
Trait {
	#name : 'FmxSQLTColumn',
	#instVars : [
		'#columnsContainer => FMOne type: #FmxSQLColumnsContainer opposite: #columns'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTColumn classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TColumn super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLTColumn >> columnsContainer [
	"Relation named: #columnsContainer type: #FmxSQLColumnsContainer opposite: #columns"

	<ignoreForCoverage>
	<generated>
	<container>
	^ columnsContainer
]

{ #category : 'accessing' }
FmxSQLTColumn >> columnsContainer: anObject [

	<ignoreForCoverage>
	<generated>
	columnsContainer := anObject
]
