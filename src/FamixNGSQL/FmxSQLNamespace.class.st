"
I am a namespace. I hold entities to define a name scope where name duplicates are forbidden.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `namespaceEntities` | `FmxSQLNamespace` | `parentNamespace` | `FmxSQLTNamedEntity` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLNamespace` | `namespace` | `FmxSQLNamespaceReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FmxSQLNamespace',
	#superclass : 'FmxSQLStructuralEntity',
	#traits : 'FamixTNamespace',
	#classTraits : 'FamixTNamespace classTrait',
	#instVars : [
		'#namespaceEntities => FMMany type: #FmxSQLTNamedEntity opposite: #parentNamespace',
		'#references => FMMany type: #FmxSQLNamespaceReference opposite: #namespace'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLNamespace class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Namespace super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLNamespace >> addNamespaceEntity: anObject [

	<ignoreForCoverage>
	<generated>
	^ self namespaceEntities add: anObject
]

{ #category : 'adding' }
FmxSQLNamespace >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'accessing' }
FmxSQLNamespace >> namespaceEntities [
	"Relation named: #namespaceEntities type: #FmxSQLTNamedEntity opposite: #parentNamespace"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ namespaceEntities
]

{ #category : 'accessing' }
FmxSQLNamespace >> namespaceEntities: anObject [

	<ignoreForCoverage>
	<generated>
	namespaceEntities value: anObject
]

{ #category : 'accessing' }
FmxSQLNamespace >> references [
	"Relation named: #references type: #FmxSQLNamespaceReference opposite: #namespace"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLNamespace >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]
