"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingColumnReferences` | `FmxSQLTWithColumnReference` | `source` | `FmxSQLColumnReference` | |



"
Trait {
	#name : 'FmxSQLTWithColumnReference',
	#instVars : [
		'#outgoingColumnReferences => FMMany type: #FmxSQLColumnReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithColumnReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithColumnReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithColumnReference >> addOutgoingColumnReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingColumnReferences add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithColumnReference >> outgoingColumnReferences [
	"Relation named: #outgoingColumnReferences type: #FmxSQLColumnReference opposite: #source"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ outgoingColumnReferences
]

{ #category : 'accessing' }
FmxSQLTWithColumnReference >> outgoingColumnReferences: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingColumnReferences value: anObject
]
