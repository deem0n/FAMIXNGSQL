"
## Relations
======================

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
	#name : 'FmxSQLNamedEntity',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTCanBeStub + FamixTNamedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTCanBeStub classTrait + FamixTNamedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLNamedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NamedEntity super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FmxSQLNamedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FmxSQLNamedEntity
]

{ #category : 'testing' }
FmxSQLNamedEntity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ true
]
