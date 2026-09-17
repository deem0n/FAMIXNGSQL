"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : 'FmxSQLSourceLanguage',
	#superclass : 'FmxSQLEntity',
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLSourceLanguage class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceLanguage super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
]
