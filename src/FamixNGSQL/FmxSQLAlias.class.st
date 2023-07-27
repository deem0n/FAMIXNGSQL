"
I am an Alias
"
Class {
	#name : #FmxSQLAlias,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FmxSQLTWithDerivedTableReference',
	#classTraits : 'FamixTAccessible classTrait + FmxSQLTWithDerivedTableReference classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FmxSQLTWithAlias opposite: #aliases'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLAlias class >> annotation [

	<FMClass: #Alias super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLAlias >> isAlias [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLAlias >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FmxSQLTWithAlias opposite: #aliases"

	<generated>
	<container>
	^ parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLAlias >> parentBehaviouralEntity: anObject [

	<generated>
	parentBehaviouralEntity := anObject
]

{ #category : #navigation }
FmxSQLAlias >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseSpecializedGroup with: self parentBehaviouralEntity
]
