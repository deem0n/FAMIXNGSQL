"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |



"
Trait {
	#name : 'FmxSQLTWithTableReference',
	#instVars : [
		'#outgoingTableReferences => FMMany type: #FmxSQLTableReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithTableReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithTableReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithTableReference >> addOutgoingTableReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingTableReferences add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithTableReference >> outgoingTableReferences [
	"Relation named: #outgoingTableReferences type: #FmxSQLTableReference opposite: #source"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ outgoingTableReferences
]

{ #category : 'accessing' }
FmxSQLTWithTableReference >> outgoingTableReferences: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingTableReferences value: anObject
]
