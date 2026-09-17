"
I am an using clause

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingDerivedTableReferences` | `FmxSQLTWithDerivedTableReference` | `source` | `FmxSQLDerivedTableReference` | |
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | `source` | `FmxSQLNamespaceReference` | |



"
Class {
	#name : 'FmxSQLUsingClause',
	#superclass : 'FmxSQLClause',
	#traits : 'FmxSQLTWithDerivedTableReference + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference',
	#classTraits : 'FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLUsingClause class >> annotation [

	<ignoreForCoverage>
	<FMClass: #UsingClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLUsingClause >> isUsingClause [

	<ignoreForCoverage>
	<generated>
	^ true
]
