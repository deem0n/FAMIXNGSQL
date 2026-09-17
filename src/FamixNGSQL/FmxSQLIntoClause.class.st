"
I am an into clause

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingColumnReferences` | `FmxSQLTWithColumnReference` | `source` | `FmxSQLColumnReference` | |
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | `source` | `FmxSQLNamespaceReference` | |



"
Class {
	#name : 'FmxSQLIntoClause',
	#superclass : 'FmxSQLClause',
	#traits : 'FmxSQLTWithColumnReference + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference',
	#classTraits : 'FmxSQLTWithColumnReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLIntoClause class >> annotation [

	<ignoreForCoverage>
	<FMClass: #IntoClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
]
