"
I am a stored procedure. That is to say, a function that is defined inside the database.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentNamespace` | `FmxSQLTNamedEntity` | `namespaceEntities` | `FmxSQLNamespace` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `aliases` | `FmxSQLTWithAlias` | `parentBehaviouralEntity` | `FmxSQLAlias` | |
| `cursors` | `FmxSQLTWithCursor` | `parentBehaviouralEntity` | `FmxSQLCursor` | |
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|
| `queries` | `FmxSQLTQueryContainer` | `container` | `FmxSQLCRUDQuery` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingColumnReferences` | `FmxSQLTWithColumnReference` | `source` | `FmxSQLColumnReference` | |
| `outgoingCursorReferences` | `FmxSQLTWithCursorReference` | `source` | `FmxSQLCursorReference` | |
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|
| `outgoingTableReferences` | `FmxSQLTWithTableReference` | `source` | `FmxSQLTableReference` | |
| `outgoingViewReferences` | `FmxSQLTWithViewReference` | `source` | `FmxSQLViewReference` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `anchorsOnIntervalsOfCode` | `FmxSQLTWithEntitySourceAnchor` | `entity` | `FmxSQLEntitySourceAnchor` | |
| `checkConstraintsCalling` | `FmxSQLStoredProcedure` | `storedProceduresCalled` | `FmxSQLCheckConstraint` | |
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|
| `exclusionConstraintsCalling` | `FmxSQLStoredProcedure` | `storedProceduresCalled` | `FmxSQLExclusionConstraint` | |
| `outgoingNamespaceReference` | `FmxSQLTWithNamespaceReference` | `source` | `FmxSQLNamespaceReference` | |
| `returnType` | `FmxSQLStoredProcedure` | `storedProceduresReturning` | `FmxSQLAbstractType` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `languageName` | `String` | nil | |
| `postgresOid` | `Number` | nil | |
| `source` | `String` | nil | Actual source code of the source entity|

"
Class {
	#name : 'FmxSQLStoredProcedure',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FamixTHasImmediateSource + FamixTInvocable + FamixTWithAccesses + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithReferences + FmxSQLBehaviouralEntity + FmxSQLTNamedEntity + FmxSQLTQueryContainer + FmxSQLTWithAlias + FmxSQLTWithColumnReference + FmxSQLTWithCursor + FmxSQLTWithCursorReference + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTHasImmediateSource classTrait + FamixTInvocable classTrait + FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithReferences classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLTNamedEntity classTrait + FmxSQLTQueryContainer classTrait + FmxSQLTWithAlias classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithCursor classTrait + FmxSQLTWithCursorReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#instVars : [
		'#checkConstraintsCalling => FMMany type: #FmxSQLCheckConstraint opposite: #storedProceduresCalled',
		'#exclusionConstraintsCalling => FMMany type: #FmxSQLExclusionConstraint opposite: #storedProceduresCalled',
		'#languageName => FMProperty',
		'#postgresOid => FMProperty',
		'#returnType => FMOne type: #FmxSQLAbstractType opposite: #storedProceduresReturning'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLStoredProcedure class >> annotation [

	<ignoreForCoverage>
	<FMClass: #StoredProcedure super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLStoredProcedure >> addCheckConstraintsCalling: anObject [

	<ignoreForCoverage>
	<generated>
	^ self checkConstraintsCalling add: anObject
]

{ #category : 'adding' }
FmxSQLStoredProcedure >> addExclusionConstraintsCalling: anObject [

	<ignoreForCoverage>
	<generated>
	^ self exclusionConstraintsCalling add: anObject
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> checkConstraintsCalling [
	"Relation named: #checkConstraintsCalling type: #FmxSQLCheckConstraint opposite: #storedProceduresCalled"

	<ignoreForCoverage>
	<generated>
	^ checkConstraintsCalling
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> checkConstraintsCalling: anObject [

	<ignoreForCoverage>
	<generated>
	checkConstraintsCalling value: anObject
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> exclusionConstraintsCalling [
	"Relation named: #exclusionConstraintsCalling type: #FmxSQLExclusionConstraint opposite: #storedProceduresCalled"

	<ignoreForCoverage>
	<generated>
	^ exclusionConstraintsCalling
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> exclusionConstraintsCalling: anObject [

	<ignoreForCoverage>
	<generated>
	exclusionConstraintsCalling value: anObject
]

{ #category : 'testing' }
FmxSQLStoredProcedure >> isStoredProcedure [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> languageName [

	<FMProperty: #languageName type: #String>
	<ignoreForCoverage>
	<generated>
	^ languageName
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> languageName: anObject [
	<ignoreForCoverage>
	<generated>
	languageName := anObject
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> postgresOid [

	<FMProperty: #postgresOid type: #Number>
	<ignoreForCoverage>
	<generated>
	^ postgresOid
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> postgresOid: anObject [
	<ignoreForCoverage>
	<generated>
	postgresOid := anObject
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> returnType [
	"Relation named: #returnType type: #FmxSQLAbstractType opposite: #storedProceduresReturning"

	<ignoreForCoverage>
	<generated>
	^ returnType
]

{ #category : 'accessing' }
FmxSQLStoredProcedure >> returnType: anObject [

	<ignoreForCoverage>
	<generated>
	returnType := anObject
]
