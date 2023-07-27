"
I am an abstract clause
"
Class {
	#name : #FmxSQLClause,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTSourceAnchor + FmxSQLTWithAlias + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + FmxSQLTWithAlias classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#query => FMOne type: #FmxSQLCRUDQuery opposite: #clauses'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLClause class >> annotation [

	<FMClass: #Clause super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLClause >> query [
	"Relation named: #query type: #FmxSQLCRUDQuery opposite: #clauses"

	<generated>
	<container>
	^ query
]

{ #category : #accessing }
FmxSQLClause >> query: anObject [

	<generated>
	query := anObject
]

{ #category : #navigation }
FmxSQLClause >> queryGroup [
	<generated>
	<navigation: 'Query'>
	^ MooseSpecializedGroup with: self query
]
