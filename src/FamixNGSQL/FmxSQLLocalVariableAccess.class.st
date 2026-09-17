"
I am an access to a local variable in a procedure.

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accessor` | `FamixTAccess` | `accesses` | `FamixTWithAccesses` | Behavioural entity making the access to the variable. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `candidates` | `FamixTAccess` | `incomingAccesses` | `FamixTAccessible` | Variables that cas be the accessed variable. to-side of the association. Most of the time it will be only one variable, but some languages might have candidates such as Python.|
| `localVariable` | `FmxSQLLocalVariableAccess` | `accesses` | `FmxSQLLocalVariable` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isWrite` | `Boolean` | false | Write access|

"
Class {
	#name : 'FmxSQLLocalVariableAccess',
	#superclass : 'FmxSQLReference',
	#traits : 'FamixTAccess + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTAccess classTrait + FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#localVariable => FMOne type: #FmxSQLLocalVariable opposite: #accesses'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLLocalVariableAccess class >> annotation [

	<ignoreForCoverage>
	<FMClass: #LocalVariableAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLLocalVariableAccess >> isLocalVariableAccess [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLLocalVariableAccess >> localVariable [
	"Relation named: #localVariable type: #FmxSQLLocalVariable opposite: #accesses"

	<ignoreForCoverage>
	<generated>
	<target>
	^ localVariable
]

{ #category : 'accessing' }
FmxSQLLocalVariableAccess >> localVariable: anObject [

	<ignoreForCoverage>
	<generated>
	localVariable := anObject
]
