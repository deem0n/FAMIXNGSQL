"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | `source` | `FmxSQLNamespaceReference` | |



"
Trait {
	#name : 'FmxSQLTWithNamespaceReference',
	#instVars : [
		'#outgoingNamespaceReference => FMMany type: #FmxSQLNamespaceReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithNamespaceReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithNamespaceReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithNamespaceReference >> addOutgoingNamespaceReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingNamespaceReference add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithNamespaceReference >> outgoingNamespaceReference [
	"Relation named: #outgoingNamespaceReference type: #FmxSQLNamespaceReference opposite: #source"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ outgoingNamespaceReference
]

{ #category : 'accessing' }
FmxSQLTWithNamespaceReference >> outgoingNamespaceReference: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingNamespaceReference value: anObject
]
