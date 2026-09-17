"
I am a reference to a table.

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLTableReference` | `outgoingTableReferences` | `FmxSQLTWithTableReference` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `table` | `FmxSQLTableReference` | `references` | `FmxSQLTable` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |



"
Class {
	#name : 'FmxSQLTableReference',
	#superclass : 'FmxSQLReference',
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#source => FMOne type: #FmxSQLTWithTableReference opposite: #outgoingTableReferences',
		'#table => FMOne type: #FmxSQLTable opposite: #references'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLTableReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #TableReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLTableReference >> source [
	"Relation named: #source type: #FmxSQLTWithTableReference opposite: #outgoingTableReferences"

	<ignoreForCoverage>
	<generated>
	<source>
	^ source
]

{ #category : 'accessing' }
FmxSQLTableReference >> source: anObject [

	<ignoreForCoverage>
	<generated>
	source := anObject
]

{ #category : 'accessing' }
FmxSQLTableReference >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #references"

	<ignoreForCoverage>
	<generated>
	<target>
	^ table
]

{ #category : 'accessing' }
FmxSQLTableReference >> table: anObject [

	<ignoreForCoverage>
	<generated>
	table := anObject
]
