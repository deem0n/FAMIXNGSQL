"
I am a group by clause

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
	#name : 'FmxSQLGroupByClause',
	#superclass : 'FmxSQLClause',
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithNamespaceReference + FmxSQLTWithReferencesGroupReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithReferencesGroupReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLGroupByClause class >> annotation [

	<ignoreForCoverage>
	<FMClass: #GroupByClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLGroupByClause >> isGroupByClause [

	<ignoreForCoverage>
	<generated>
	^ true
]
