"
I am an abstract superclass for Create Read Update Delete (CRUD) queries.

The Create query is the INSERT query in SQL.

The Read query is the SELECT query in SQL.

The Update query is the UPDATE query in SQL.

The Delete query is the DELETE query in SQL.

My subclasses represent these four queries.
"
Class {
	#name : #FmxSQLCRUDQuery,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTSourceAnchor + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#derivedTableDefining => FMOne type: #FmxSQLDerivedTable opposite: #query',
		'#clauses => FMMany type: #FmxSQLClause opposite: #query',
		'#container => FMOne type: #FmxSQLTQueryContainer opposite: #queries'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCRUDQuery class >> annotation [

	<FMClass: #CRUDQuery super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLCRUDQuery >> addClause: anObject [
	<generated>
	^ self clauses add: anObject
]

{ #category : #accessing }
FmxSQLCRUDQuery >> clauses [
	"Relation named: #clauses type: #FmxSQLClause opposite: #query"

	<generated>
	<derived>
	^ clauses
]

{ #category : #accessing }
FmxSQLCRUDQuery >> clauses: anObject [

	<generated>
	clauses value: anObject
]

{ #category : #navigation }
FmxSQLCRUDQuery >> clausesGroup [
	<generated>
	<navigation: 'Clauses'>
	^ MooseSpecializedGroup withAll: self clauses asSet
]

{ #category : #accessing }
FmxSQLCRUDQuery >> container [
	"Relation named: #container type: #FmxSQLTQueryContainer opposite: #queries"

	<generated>
	<container>
	^ container
]

{ #category : #accessing }
FmxSQLCRUDQuery >> container: anObject [

	<generated>
	container := anObject
]

{ #category : #navigation }
FmxSQLCRUDQuery >> containerGroup [
	<generated>
	<navigation: 'Container'>
	^ MooseSpecializedGroup with: self container
]

{ #category : #accessing }
FmxSQLCRUDQuery >> derivedTableDefining [
	"Relation named: #derivedTableDefining type: #FmxSQLDerivedTable opposite: #query"

	<generated>
	<container>
	<derived>
	^ derivedTableDefining
]

{ #category : #accessing }
FmxSQLCRUDQuery >> derivedTableDefining: anObject [

	<generated>
	derivedTableDefining := anObject
]

{ #category : #navigation }
FmxSQLCRUDQuery >> derivedTableDefiningGroup [
	<generated>
	<navigation: 'DerivedTableDefining'>
	^ MooseSpecializedGroup with: self derivedTableDefining
]
