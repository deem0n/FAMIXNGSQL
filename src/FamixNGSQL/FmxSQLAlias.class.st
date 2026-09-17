"
I am an Alias

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FmxSQLAlias` | `aliases` | `FmxSQLTWithAlias` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingDerivedTableReferences` | `FmxSQLTWithDerivedTableReference` | `source` | `FmxSQLDerivedTableReference` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|



"
Class {
	#name : 'FmxSQLAlias',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FamixTAccessible + FmxSQLTWithDerivedTableReference',
	#classTraits : 'FamixTAccessible classTrait + FmxSQLTWithDerivedTableReference classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FmxSQLTWithAlias opposite: #aliases'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLAlias class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Alias super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLAlias >> isAlias [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLAlias >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FmxSQLTWithAlias opposite: #aliases"

	<ignoreForCoverage>
	<generated>
	<container>
	^ parentBehaviouralEntity
]

{ #category : 'accessing' }
FmxSQLAlias >> parentBehaviouralEntity: anObject [

	<ignoreForCoverage>
	<generated>
	parentBehaviouralEntity := anObject
]
