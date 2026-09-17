"
I am an intersect clause

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingDerivedTableReferences` | `FmxSQLTWithDerivedTableReference` | `source` | `FmxSQLDerivedTableReference` | |
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |
| `outgoingViewReferences` | `FmxSQLTWithViewReference` | `source` | `FmxSQLViewReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | `source` | `FmxSQLNamespaceReference` | |



"
Class {
	#name : 'FmxSQLIntersectClause',
	#superclass : 'FmxSQLClause',
	#traits : 'FmxSQLTWithDerivedTableReference + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLIntersectClause class >> annotation [

	<ignoreForCoverage>
	<FMClass: #IntersectClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLIntersectClause >> isIntersectClause [

	<ignoreForCoverage>
	<generated>
	^ true
]
