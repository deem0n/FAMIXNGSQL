"
I am a call to a stored procedure of the model.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FmxSQLStoredProcedureCall` | `storedProcedureContainer` | `FmxSQLReference` | |

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sender` | `FamixTInvocation` | `outgoingInvocations` | `FamixTWithInvocations` | Behavioural entity making the call. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `candidates` | `FamixTInvocation` | `incomingInvocations` | `FamixTInvocable` | List of candidate behavioural entities for receiving the invocation|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |
| `receiver` | `FamixTInvocation` | `receivingInvocations` | `FamixTInvocationsReceiver` | Named entity (variable, class...) receiving the invocation. to-side of the association|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `signature` | `String` | nil | Signature of the message being sent|

"
Class {
	#name : 'FmxSQLStoredProcedureCall',
	#superclass : 'FmxSQLReference',
	#traits : 'FamixTInvocation + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTInvocation classTrait + FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#arguments => FMMany type: #FmxSQLReference opposite: #storedProcedureContainer'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLStoredProcedureCall class >> annotation [

	<ignoreForCoverage>
	<FMClass: #StoredProcedureCall super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLStoredProcedureCall >> addArgument: anObject [

	<ignoreForCoverage>
	<generated>
	^ self arguments add: anObject
]

{ #category : 'accessing' }
FmxSQLStoredProcedureCall >> arguments [
	"Relation named: #arguments type: #FmxSQLReference opposite: #storedProcedureContainer"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ arguments
]

{ #category : 'accessing' }
FmxSQLStoredProcedureCall >> arguments: anObject [

	<ignoreForCoverage>
	<generated>
	arguments value: anObject
]

{ #category : 'testing' }
FmxSQLStoredProcedureCall >> isStoredProcedureCall [

	<ignoreForCoverage>
	<generated>
	^ true
]
