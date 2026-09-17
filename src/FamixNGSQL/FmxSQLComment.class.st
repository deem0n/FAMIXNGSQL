"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FmxSQLComment',
	#superclass : 'FmxSQLSourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLComment class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Comment super: #FmxSQLSourcedEntity>
	<package: #FamixNGSQL>
	<generated>
]
