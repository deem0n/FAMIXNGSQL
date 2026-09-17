"
I am an union clause

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
	#name : 'FmxSQLUnionClause',
	#superclass : 'FmxSQLClause',
	#traits : 'FmxSQLTWithDerivedTableReference + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLUnionClause class >> annotation [

	<ignoreForCoverage>
	<FMClass: #UnionClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLUnionClause >> isUnionClause [

	<ignoreForCoverage>
	<generated>
	^ true
]
