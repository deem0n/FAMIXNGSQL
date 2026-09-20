"
I am an abstract object that represent a reference made to another entity in the source code a behavioural entity.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `belongsToGroup` | `FmxSQLReference` | `references` | `FmxSQLReferencesGroup` | |
| `storedProcedureContainer` | `FmxSQLReference` | `arguments` | `FmxSQLStoredProcedureCall` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FmxSQLReference',
	#superclass : 'FmxSQLAssociation',
	#traits : 'FamixTSourceEntity + FmxSQLTArgument + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + FmxSQLTArgument classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#belongsToGroup => FMOne type: #FmxSQLReferencesGroup opposite: #references',
		'#storedProcedureContainer => FMOne type: #FmxSQLStoredProcedureCall opposite: #arguments'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Reference super: #FmxSQLAssociation>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLReference >> belongsToGroup [
	"Relation named: #belongsToGroup type: #FmxSQLReferencesGroup opposite: #references"

	<ignoreForCoverage>
	<generated>
	<container>
	^ belongsToGroup
]

{ #category : 'accessing' }
FmxSQLReference >> belongsToGroup: anObject [

	<ignoreForCoverage>
	<generated>
	belongsToGroup := anObject
]

{ #category : 'accessing' }
FmxSQLReference >> storedProcedureContainer [
	"Relation named: #storedProcedureContainer type: #FmxSQLStoredProcedureCall opposite: #arguments"

	<ignoreForCoverage>
	<generated>
	<container>
	^ storedProcedureContainer
]

{ #category : 'accessing' }
FmxSQLReference >> storedProcedureContainer: anObject [

	<ignoreForCoverage>
	<generated>
	storedProcedureContainer := anObject
]
