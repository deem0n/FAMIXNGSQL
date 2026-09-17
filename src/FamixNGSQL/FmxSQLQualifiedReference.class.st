"
I model a qualified reference.

For example, namespace.table.column is modeled as 3 references:
- NamespaceReference
- TableReference
- ColumnReference

together grouped in a QualifiedReference.

One can ask the #qualifiedReference to any reference in the system, it will be set if it has one.

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLQualifiedReference` | `qualifiedReference` | `FmxSQLTWithQualifiedReference` | |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FmxSQLQualifiedReference',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#instVars : [
		'#references => FMMany type: #FmxSQLTWithQualifiedReference opposite: #qualifiedReference'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLQualifiedReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #QualifiedReference super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLQualifiedReference >> references [
	"Relation named: #references type: #FmxSQLTWithQualifiedReference opposite: #qualifiedReference"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLQualifiedReference >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]
