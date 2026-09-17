"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |



"
Trait {
	#name : 'FmxSQLTWithQualifiedReference',
	#instVars : [
		'#qualifiedReference => FMOne type: #FmxSQLQualifiedReference opposite: #references'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithQualifiedReference classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithQualifiedReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLTWithQualifiedReference >> qualifiedReference [
	"Relation named: #qualifiedReference type: #FmxSQLQualifiedReference opposite: #references"

	<ignoreForCoverage>
	<generated>
	^ qualifiedReference
]

{ #category : 'accessing' }
FmxSQLTWithQualifiedReference >> qualifiedReference: anObject [

	<ignoreForCoverage>
	<generated>
	qualifiedReference := anObject
]
