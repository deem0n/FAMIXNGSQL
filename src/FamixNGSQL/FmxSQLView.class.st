"
I am a view. I can be used transparently as a table but I do not hold data. My data are fetched by the SELECT query which defines myself.
"
Class {
	#name : #FmxSQLView,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FmxSQLAbstractType + FmxSQLBehaviouralEntity + FmxSQLColumnsContainer + FmxSQLTNamedEntity + FmxSQLTQueryContainer + FmxSQLTWithImmediateSource',
	#classTraits : 'FmxSQLAbstractType classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLColumnsContainer classTrait + FmxSQLTNamedEntity classTrait + FmxSQLTQueryContainer classTrait + FmxSQLTWithImmediateSource classTrait',
	#instVars : [
		'#query => FMOne type: #FmxSQLSelectQuery opposite: #viewDefining',
		'#references => FMMany type: #FmxSQLViewReference opposite: #view'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLView class >> annotation [

	<FMClass: #View super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLView >> addReference: anObject [
	<generated>
	^ self references add: anObject
]

{ #category : #testing }
FmxSQLView >> isView [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLView >> query [
	"Relation named: #query type: #FmxSQLSelectQuery opposite: #viewDefining"

	<generated>
	^ query
]

{ #category : #accessing }
FmxSQLView >> query: anObject [

	<generated>
	query := anObject
]

{ #category : #navigation }
FmxSQLView >> queryGroup [
	<generated>
	<navigation: 'Query'>
	^ MooseSpecializedGroup with: self query
]

{ #category : #accessing }
FmxSQLView >> references [
	"Relation named: #references type: #FmxSQLViewReference opposite: #view"

	<generated>
	<derived>
	^ references
]

{ #category : #accessing }
FmxSQLView >> references: anObject [

	<generated>
	references value: anObject
]
