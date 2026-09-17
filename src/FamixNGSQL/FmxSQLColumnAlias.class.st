"
I am an alias for a column.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columnsContainer` | `FmxSQLTColumn` | `columns` | `FmxSQLColumnsContainer` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | `source` | `FmxSQLTReferencesGroupReference` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingColumnReferences` | `FmxSQLTWithColumnReference` | `source` | `FmxSQLColumnReference` | |
| `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | `source` | `FmxSQLTReferencesGroupReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columnsContainerAlias` | `FmxSQLColumnAlias` | `columnAliases` | `FmxSQLColumnsContainerAlias` | |



"
Class {
	#name : 'FmxSQLColumnAlias',
	#superclass : 'FmxSQLAlias',
	#traits : 'FmxSQLTColumn + FmxSQLTWithColumnReference + FmxSQLTWithReferencesGroupReference',
	#classTraits : 'FmxSQLTColumn classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithReferencesGroupReference classTrait',
	#instVars : [
		'#columnsContainerAlias => FMOne type: #FmxSQLColumnsContainerAlias opposite: #columnAliases'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLColumnAlias class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ColumnAlias super: #FmxSQLAlias>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLColumnAlias >> columnsContainerAlias [
	"Relation named: #columnsContainerAlias type: #FmxSQLColumnsContainerAlias opposite: #columnAliases"

	<ignoreForCoverage>
	<generated>
	^ columnsContainerAlias
]

{ #category : 'accessing' }
FmxSQLColumnAlias >> columnsContainerAlias: anObject [

	<ignoreForCoverage>
	<generated>
	columnsContainerAlias := anObject
]
