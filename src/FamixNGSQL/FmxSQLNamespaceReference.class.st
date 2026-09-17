"
I model a reference made to a namespace from source code.

## Relations
======================

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `namespace` | `FmxSQLNamespaceReference` | `references` | `FmxSQLNamespace` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |
| `source` | `FmxSQLNamespaceReference` | `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | |



"
Class {
	#name : 'FmxSQLNamespaceReference',
	#superclass : 'FmxSQLReference',
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#namespace => FMOne type: #FmxSQLNamespace opposite: #references',
		'#source => FMOne type: #FmxSQLTWithNamespaceReference opposite: #outgoingNamespaceReference'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLNamespaceReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NamespaceReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLNamespaceReference >> namespace [
	"Relation named: #namespace type: #FmxSQLNamespace opposite: #references"

	<ignoreForCoverage>
	<generated>
	<target>
	^ namespace
]

{ #category : 'accessing' }
FmxSQLNamespaceReference >> namespace: anObject [

	<ignoreForCoverage>
	<generated>
	namespace := anObject
]

{ #category : 'accessing' }
FmxSQLNamespaceReference >> source [
	"Relation named: #source type: #FmxSQLTWithNamespaceReference opposite: #outgoingNamespaceReference"

	<ignoreForCoverage>
	<generated>
	^ source
]

{ #category : 'accessing' }
FmxSQLNamespaceReference >> source: anObject [

	<ignoreForCoverage>
	<generated>
	source := anObject
]
