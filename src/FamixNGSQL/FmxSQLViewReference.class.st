"
I am a reference to a view.

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLViewReference` | `outgoingViewReferences` | `FmxSQLTWithViewReference` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `view` | `FmxSQLViewReference` | `references` | `FmxSQLView` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |



"
Class {
	#name : 'FmxSQLViewReference',
	#superclass : 'FmxSQLReference',
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#source => FMOne type: #FmxSQLTWithViewReference opposite: #outgoingViewReferences',
		'#view => FMOne type: #FmxSQLView opposite: #references'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLViewReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ViewReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLViewReference >> source [
	"Relation named: #source type: #FmxSQLTWithViewReference opposite: #outgoingViewReferences"

	<ignoreForCoverage>
	<generated>
	<source>
	^ source
]

{ #category : 'accessing' }
FmxSQLViewReference >> source: anObject [

	<ignoreForCoverage>
	<generated>
	source := anObject
]

{ #category : 'accessing' }
FmxSQLViewReference >> view [
	"Relation named: #view type: #FmxSQLView opposite: #references"

	<ignoreForCoverage>
	<generated>
	<target>
	^ view
]

{ #category : 'accessing' }
FmxSQLViewReference >> view: anObject [

	<ignoreForCoverage>
	<generated>
	view := anObject
]
