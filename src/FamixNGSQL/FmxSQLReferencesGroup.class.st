"
I model a group of refererences to other entities.

I provide an abstraction to avoid modelling the AST in the MM.

For example I can appear in select query like:

SELECT fct1(id)+fct2(id) AS id -- <-- Here a reference group is created containing ref to fct1, fct2
FROM table

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLReferencesGroup` | `belongsToGroup` | `FmxSQLReference` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferencesGroupReference` | `FmxSQLReferencesGroup` | `referencesGroup` | `FmxSQLTReferencesGroupReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FmxSQLReferencesGroup',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#incomingReferencesGroupReference => FMMany type: #FmxSQLTReferencesGroupReference opposite: #referencesGroup',
		'#references => FMMany type: #FmxSQLReference opposite: #belongsToGroup'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLReferencesGroup class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ReferencesGroup super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLReferencesGroup >> addIncomingReferencesGroupReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self incomingReferencesGroupReference add: anObject
]

{ #category : 'adding' }
FmxSQLReferencesGroup >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'accessing' }
FmxSQLReferencesGroup >> incomingReferencesGroupReference [
	"Relation named: #incomingReferencesGroupReference type: #FmxSQLTReferencesGroupReference opposite: #referencesGroup"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ incomingReferencesGroupReference
]

{ #category : 'accessing' }
FmxSQLReferencesGroup >> incomingReferencesGroupReference: anObject [

	<ignoreForCoverage>
	<generated>
	incomingReferencesGroupReference value: anObject
]

{ #category : 'accessing' }
FmxSQLReferencesGroup >> references [
	"Relation named: #references type: #FmxSQLReference opposite: #belongsToGroup"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLReferencesGroup >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]
