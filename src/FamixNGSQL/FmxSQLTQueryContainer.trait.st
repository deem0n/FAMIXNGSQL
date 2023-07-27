"
I am an abstract super class for behavioural entities that can contain queries in their source code.
"
Trait {
	#name : #FmxSQLTQueryContainer,
	#instVars : [
		'#queries => FMMany type: #FmxSQLCRUDQuery opposite: #container'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTQueryContainer classSide >> annotation [

	<FMClass: #TQueryContainer super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTQueryContainer >> addQuery: anObject [
	<generated>
	^ self queries add: anObject
]

{ #category : #testing }
FmxSQLTQueryContainer >> isQueryContainer [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLTQueryContainer >> queries [
	"Relation named: #queries type: #FmxSQLCRUDQuery opposite: #container"

	<generated>
	<derived>
	^ queries
]

{ #category : #accessing }
FmxSQLTQueryContainer >> queries: anObject [

	<generated>
	queries value: anObject
]

{ #category : #navigation }
FmxSQLTQueryContainer >> queriesGroup [
	<generated>
	<navigation: 'Queries'>
	^ MooseSpecializedGroup withAll: self queries asSet
]
