"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLTReferencesGroupReference` | `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | |

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLTReferencesGroupReference` | `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `referencesGroup` | `FmxSQLTReferencesGroupReference` | `incomingReferencesGroupReference` | `FmxSQLReferencesGroup` | |



"
Trait {
	#name : 'FmxSQLTReferencesGroupReference',
	#instVars : [
		'#referencesGroup => FMOne type: #FmxSQLReferencesGroup opposite: #incomingReferencesGroupReference',
		'#source => FMOne type: #FmxSQLTWithReferencesGroupReference opposite: #outgoingReferencesGroupReferences'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTReferencesGroupReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TReferencesGroupReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLTReferencesGroupReference >> referencesGroup [
	"Relation named: #referencesGroup type: #FmxSQLReferencesGroup opposite: #incomingReferencesGroupReference"

	<ignoreForCoverage>
	<generated>
	<target>
	^ referencesGroup
]

{ #category : 'accessing' }
FmxSQLTReferencesGroupReference >> referencesGroup: anObject [

	<ignoreForCoverage>
	<generated>
	referencesGroup := anObject
]

{ #category : 'accessing' }
FmxSQLTReferencesGroupReference >> source [
	"Relation named: #source type: #FmxSQLTWithReferencesGroupReference opposite: #outgoingReferencesGroupReferences"

	<ignoreForCoverage>
	<generated>
	<container>
	<source>
	^ source
]

{ #category : 'accessing' }
FmxSQLTReferencesGroupReference >> source: anObject [

	<ignoreForCoverage>
	<generated>
	source := anObject
]
