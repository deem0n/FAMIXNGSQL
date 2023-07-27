"
I model a group of refererences to other entities.

I provide an abstraction to avoid modelling the AST in the MM.

For example I can appear in select query like:

SELECT fct1(id)+fct2(id) AS id -- <-- Here a reference group is created containing ref to fct1, fct2
FROM table
"
Class {
	#name : #FmxSQLReferencesGroup,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTSourceAnchor + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#references => FMMany type: #FmxSQLReference opposite: #belongsToGroup',
		'#incomingReferencesGroupReference => FMMany type: #FmxSQLTReferencesGroupReference opposite: #referencesGroup'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLReferencesGroup class >> annotation [

	<FMClass: #ReferencesGroup super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLReferencesGroup >> addIncomingReferencesGroupReference: anObject [
	<generated>
	^ self incomingReferencesGroupReference add: anObject
]

{ #category : #adding }
FmxSQLReferencesGroup >> addReference: anObject [
	<generated>
	^ self references add: anObject
]

{ #category : #accessing }
FmxSQLReferencesGroup >> incomingReferencesGroupReference [
	"Relation named: #incomingReferencesGroupReference type: #FmxSQLTReferencesGroupReference opposite: #referencesGroup"

	<generated>
	<derived>
	^ incomingReferencesGroupReference
]

{ #category : #accessing }
FmxSQLReferencesGroup >> incomingReferencesGroupReference: anObject [

	<generated>
	incomingReferencesGroupReference value: anObject
]

{ #category : #accessing }
FmxSQLReferencesGroup >> references [
	"Relation named: #references type: #FmxSQLReference opposite: #belongsToGroup"

	<generated>
	<derived>
	^ references
]

{ #category : #accessing }
FmxSQLReferencesGroup >> references: anObject [

	<generated>
	references value: anObject
]

{ #category : #navigation }
FmxSQLReferencesGroup >> referencesGroup [
	<generated>
	<navigation: 'References'>
	^ MooseSpecializedGroup withAll: self references asSet
]
