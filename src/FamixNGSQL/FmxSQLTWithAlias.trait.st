Trait {
	#name : #FmxSQLTWithAlias,
	#instVars : [
		'#aliases => FMMany type: #FmxSQLAlias opposite: #parentBehaviouralEntity'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithAlias classSide >> annotation [

	<FMClass: #TWithAlias super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithAlias >> addAliase: anObject [
	<generated>
	^ self aliases add: anObject
]

{ #category : #accessing }
FmxSQLTWithAlias >> aliases [
	"Relation named: #aliases type: #FmxSQLAlias opposite: #parentBehaviouralEntity"

	<generated>
	<derived>
	^ aliases
]

{ #category : #accessing }
FmxSQLTWithAlias >> aliases: anObject [

	<generated>
	aliases value: anObject
]

{ #category : #navigation }
FmxSQLTWithAlias >> aliasesGroup [
	<generated>
	<navigation: 'Aliases'>
	^ MooseSpecializedGroup withAll: self aliases asSet
]
