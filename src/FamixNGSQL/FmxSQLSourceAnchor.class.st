"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FmxSQLSourceAnchor',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLSourceAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceAnchor super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FmxSQLSourceAnchor class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FmxSQLSourceAnchor
]
