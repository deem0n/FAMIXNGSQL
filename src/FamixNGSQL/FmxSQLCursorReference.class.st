"
I am a reference to a cursor

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLCursorReference` | `outgoingCursorReferences` | `FmxSQLTWithCursorReference` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `cursor` | `FmxSQLCursorReference` | `references` | `FmxSQLCursor` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |



"
Class {
	#name : 'FmxSQLCursorReference',
	#superclass : 'FmxSQLReference',
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#cursor => FMOne type: #FmxSQLCursor opposite: #references',
		'#source => FMOne type: #FmxSQLTWithCursorReference opposite: #outgoingCursorReferences'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLCursorReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CursorReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLCursorReference >> cursor [
	"Relation named: #cursor type: #FmxSQLCursor opposite: #references"

	<ignoreForCoverage>
	<generated>
	<target>
	^ cursor
]

{ #category : 'accessing' }
FmxSQLCursorReference >> cursor: anObject [

	<ignoreForCoverage>
	<generated>
	cursor := anObject
]

{ #category : 'accessing' }
FmxSQLCursorReference >> source [
	"Relation named: #source type: #FmxSQLTWithCursorReference opposite: #outgoingCursorReferences"

	<ignoreForCoverage>
	<generated>
	<source>
	^ source
]

{ #category : 'accessing' }
FmxSQLCursorReference >> source: anObject [

	<ignoreForCoverage>
	<generated>
	source := anObject
]
