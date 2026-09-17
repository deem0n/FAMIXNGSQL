"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | `source` | `FmxSQLTReferencesGroupReference` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | `source` | `FmxSQLTReferencesGroupReference` | |



"
Trait {
	#name : 'FmxSQLTWithReferencesGroupReference',
	#instVars : [
		'#outgoingReferencesGroupReferences => FMMany type: #FmxSQLTReferencesGroupReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithReferencesGroupReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithReferencesGroupReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithReferencesGroupReference >> addOutgoingReferencesGroupReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingReferencesGroupReferences add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferences [
	"Relation named: #outgoingReferencesGroupReferences type: #FmxSQLTReferencesGroupReference opposite: #source"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ outgoingReferencesGroupReferences
]

{ #category : 'accessing' }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferences: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingReferencesGroupReferences value: anObject
]
