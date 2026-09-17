"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentNamespace` | `FmxSQLTNamedEntity` | `namespaceEntities` | `FmxSQLNamespace` | |



"
Trait {
	#name : 'FmxSQLTNamedEntity',
	#instVars : [
		'#parentNamespace => FMOne type: #FmxSQLNamespace opposite: #namespaceEntities'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTNamedEntity classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TNamedEntity super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLTNamedEntity >> parentNamespace [
	"Relation named: #parentNamespace type: #FmxSQLNamespace opposite: #namespaceEntities"

	<ignoreForCoverage>
	<generated>
	<container>
	^ parentNamespace
]

{ #category : 'accessing' }
FmxSQLTNamedEntity >> parentNamespace: anObject [

	<ignoreForCoverage>
	<generated>
	parentNamespace := anObject
]
