"
I am an abstract super class for entities that contain columns. Two of my well-known subclasses are the table and the view.
"
Trait {
	#name : #FmxSQLColumnsContainer,
	#instVars : [
		'#columns => FMMany type: #FmxSQLTColumn opposite: #columnsContainer'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLColumnsContainer classSide >> annotation [

	<FMClass: #ColumnsContainer super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLColumnsContainer >> addColumn: anObject [
	<generated>
	^ self columns add: anObject
]

{ #category : #accessing }
FmxSQLColumnsContainer >> columns [
	"Relation named: #columns type: #FmxSQLTColumn opposite: #columnsContainer"

	<generated>
	<derived>
	^ columns
]

{ #category : #accessing }
FmxSQLColumnsContainer >> columns: anObject [

	<generated>
	columns value: anObject
]

{ #category : #navigation }
FmxSQLColumnsContainer >> columnsGroup [
	<generated>
	<navigation: 'Columns'>
	^ MooseSpecializedGroup withAll: self columns asSet
]
