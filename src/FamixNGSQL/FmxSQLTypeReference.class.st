"
I am reference to a type of the model.

## Relations
======================

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `type` | `FmxSQLTypeReference` | `references` | `FmxSQLType` | |



"
Class {
	#name : 'FmxSQLTypeReference',
	#superclass : 'FmxSQLReference',
	#instVars : [
		'#type => FMOne type: #FmxSQLType opposite: #references'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLTypeReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #TypeReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLTypeReference >> type [
	"Relation named: #type type: #FmxSQLType opposite: #references"

	<ignoreForCoverage>
	<generated>
	<target>
	^ type
]

{ #category : 'accessing' }
FmxSQLTypeReference >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]
