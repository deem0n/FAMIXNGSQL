"
I am a reference to a derived table.

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLDerivedTableReference` | `outgoingDerivedTableReferences` | `FmxSQLTWithDerivedTableReference` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `derivedTable` | `FmxSQLDerivedTableReference` | `references` | `FmxSQLDerivedTable` | |



"
Class {
	#name : 'FmxSQLDerivedTableReference',
	#superclass : 'FmxSQLReference',
	#instVars : [
		'#derivedTable => FMOne type: #FmxSQLDerivedTable opposite: #references',
		'#source => FMOne type: #FmxSQLTWithDerivedTableReference opposite: #outgoingDerivedTableReferences'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLDerivedTableReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #DerivedTableReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLDerivedTableReference >> derivedTable [
	"Relation named: #derivedTable type: #FmxSQLDerivedTable opposite: #references"

	<ignoreForCoverage>
	<generated>
	<target>
	^ derivedTable
]

{ #category : 'accessing' }
FmxSQLDerivedTableReference >> derivedTable: anObject [

	<ignoreForCoverage>
	<generated>
	derivedTable := anObject
]

{ #category : 'accessing' }
FmxSQLDerivedTableReference >> source [
	"Relation named: #source type: #FmxSQLTWithDerivedTableReference opposite: #outgoingDerivedTableReferences"

	<ignoreForCoverage>
	<generated>
	<source>
	^ source
]

{ #category : 'accessing' }
FmxSQLDerivedTableReference >> source: anObject [

	<ignoreForCoverage>
	<generated>
	source := anObject
]
