"
I am an alias for a table. Eventually I also contain alias to columns.

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |
| `outgoingViewReferences` | `FmxSQLTWithViewReference` | `source` | `FmxSQLViewReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columnAliases` | `FmxSQLColumnsContainerAlias` | `columnsContainerAlias` | `FmxSQLColumnAlias` | |



"
Class {
	#name : 'FmxSQLColumnsContainerAlias',
	#superclass : 'FmxSQLAlias',
	#traits : 'FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#instVars : [
		'#columnAliases => FMMany type: #FmxSQLColumnAlias opposite: #columnsContainerAlias'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLColumnsContainerAlias class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ColumnsContainerAlias super: #FmxSQLAlias>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLColumnsContainerAlias >> addColumnAlias: anObject [

	<ignoreForCoverage>
	<generated>
	^ self columnAliases add: anObject
]

{ #category : 'accessing' }
FmxSQLColumnsContainerAlias >> columnAliases [
	"Relation named: #columnAliases type: #FmxSQLColumnAlias opposite: #columnsContainerAlias"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ columnAliases
]

{ #category : 'accessing' }
FmxSQLColumnsContainerAlias >> columnAliases: anObject [

	<ignoreForCoverage>
	<generated>
	columnAliases value: anObject
]
