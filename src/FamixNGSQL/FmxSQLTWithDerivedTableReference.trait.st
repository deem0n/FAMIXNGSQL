"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingDerivedTableReferences` | `FmxSQLTWithDerivedTableReference` | `source` | `FmxSQLDerivedTableReference` | |



"
Trait {
	#name : 'FmxSQLTWithDerivedTableReference',
	#instVars : [
		'#outgoingDerivedTableReferences => FMMany type: #FmxSQLDerivedTableReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithDerivedTableReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithDerivedTableReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithDerivedTableReference >> addOutgoingDerivedTableReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingDerivedTableReferences add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithDerivedTableReference >> outgoingDerivedTableReferences [
	"Relation named: #outgoingDerivedTableReferences type: #FmxSQLDerivedTableReference opposite: #source"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ outgoingDerivedTableReferences
]

{ #category : 'accessing' }
FmxSQLTWithDerivedTableReference >> outgoingDerivedTableReferences: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingDerivedTableReferences value: anObject
]
