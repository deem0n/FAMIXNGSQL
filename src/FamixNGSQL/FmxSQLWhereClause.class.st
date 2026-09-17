"
I am a where clause

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | `source` | `FmxSQLTReferencesGroupReference` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingColumnReferences` | `FmxSQLTWithColumnReference` | `source` | `FmxSQLColumnReference` | |
| `outgoingDerivedTableReferences` | `FmxSQLTWithDerivedTableReference` | `source` | `FmxSQLDerivedTableReference` | |
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | `source` | `FmxSQLTReferencesGroupReference` | |
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |
| `outgoingViewReferences` | `FmxSQLTWithViewReference` | `source` | `FmxSQLViewReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | `source` | `FmxSQLNamespaceReference` | |



"
Class {
	#name : 'FmxSQLWhereClause',
	#superclass : 'FmxSQLClause',
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference + FmxSQLTWithNamespaceReference + FmxSQLTWithReferencesGroupReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithReferencesGroupReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLWhereClause class >> annotation [

	<ignoreForCoverage>
	<FMClass: #WhereClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLWhereClause >> isWhereClause [

	<ignoreForCoverage>
	<generated>
	^ true
]
