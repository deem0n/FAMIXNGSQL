"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `aliases` | `FmxSQLTWithAlias` | `parentBehaviouralEntity` | `FmxSQLAlias` | |



"
Trait {
	#name : 'FmxSQLTWithAlias',
	#instVars : [
		'#aliases => FMMany type: #FmxSQLAlias opposite: #parentBehaviouralEntity'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithAlias classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithAlias super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithAlias >> addAlias: anObject [

	<ignoreForCoverage>
	<generated>
	^ self aliases add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithAlias >> aliases [
	"Relation named: #aliases type: #FmxSQLAlias opposite: #parentBehaviouralEntity"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ aliases
]

{ #category : 'accessing' }
FmxSQLTWithAlias >> aliases: anObject [

	<ignoreForCoverage>
	<generated>
	aliases value: anObject
]
