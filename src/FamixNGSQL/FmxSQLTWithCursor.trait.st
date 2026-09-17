"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `cursors` | `FmxSQLTWithCursor` | `parentBehaviouralEntity` | `FmxSQLCursor` | |



"
Trait {
	#name : 'FmxSQLTWithCursor',
	#instVars : [
		'#cursors => FMMany type: #FmxSQLCursor opposite: #parentBehaviouralEntity'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithCursor classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithCursor super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithCursor >> addCursor: anObject [

	<ignoreForCoverage>
	<generated>
	^ self cursors add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithCursor >> cursors [
	"Relation named: #cursors type: #FmxSQLCursor opposite: #parentBehaviouralEntity"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ cursors
]

{ #category : 'accessing' }
FmxSQLTWithCursor >> cursors: anObject [

	<ignoreForCoverage>
	<generated>
	cursors value: anObject
]
