"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingViewReferences` | `FmxSQLTWithViewReference` | `source` | `FmxSQLViewReference` | |



"
Trait {
	#name : 'FmxSQLTWithViewReference',
	#instVars : [
		'#outgoingViewReferences => FMMany type: #FmxSQLViewReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithViewReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithViewReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithViewReference >> addOutgoingViewReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingViewReferences add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithViewReference >> outgoingViewReferences [
	"Relation named: #outgoingViewReferences type: #FmxSQLViewReference opposite: #source"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ outgoingViewReferences
]

{ #category : 'accessing' }
FmxSQLTWithViewReference >> outgoingViewReferences: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingViewReferences value: anObject
]
