"
I am an abstract super class for entities that contain columns. Two of my well-known subclasses are the table and the view.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLColumnsContainer` | `columnsContainer` | `FmxSQLTColumn` | |



"
Trait {
	#name : 'FmxSQLColumnsContainer',
	#instVars : [
		'#columns => FMMany type: #FmxSQLTColumn opposite: #columnsContainer'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLColumnsContainer classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #ColumnsContainer super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLColumnsContainer >> addColumn: anObject [

	<ignoreForCoverage>
	<generated>
	^ self columns add: anObject
]

{ #category : 'accessing' }
FmxSQLColumnsContainer >> columns [
	"Relation named: #columns type: #FmxSQLTColumn opposite: #columnsContainer"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ columns
]

{ #category : 'accessing' }
FmxSQLColumnsContainer >> columns: anObject [

	<ignoreForCoverage>
	<generated>
	columns value: anObject
]
