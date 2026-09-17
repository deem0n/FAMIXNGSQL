"
I am an abstract superclass for structural entities. A structural entity is an entity that defines how data are structured by the database.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentNamespace` | `FmxSQLTNamedEntity` | `namespaceEntities` | `FmxSQLNamespace` | |



"
Class {
	#name : 'FmxSQLStructuralEntity',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FmxSQLTNamedEntity',
	#classTraits : 'FmxSQLTNamedEntity classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLStructuralEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #StructuralEntity super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]
