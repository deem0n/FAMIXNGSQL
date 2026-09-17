"
I am reference to a column in a table of the model.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `triggerStoredProceduresReferencing` | `FmxSQLColumnReference` | `columnsReferenced` | `FmxSQLTriggerStoredProcedure` | |

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `foreignKeyConstraintSource` | `FmxSQLColumnReference` | `outgoingForeignKeyColumnReferences` | `FmxSQLForeignKeyConstraint` | |
| `source` | `FmxSQLColumnReference` | `outgoingColumnReferences` | `FmxSQLTWithColumnReference` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `column` | `FmxSQLColumnReference` | `references` | `FmxSQLColumn` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedReference` | `FmxSQLTWithQualifiedReference` | `references` | `FmxSQLQualifiedReference` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isCertain` | `Boolean` | nil | |
| `isWildCardReference` | `Boolean` | nil | |

"
Class {
	#name : 'FmxSQLColumnReference',
	#superclass : 'FmxSQLReference',
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#column => FMOne type: #FmxSQLColumn opposite: #references',
		'#foreignKeyConstraintSource => FMOne type: #FmxSQLForeignKeyConstraint opposite: #outgoingForeignKeyColumnReferences',
		'#isCertain => FMProperty',
		'#isWildCardReference => FMProperty',
		'#source => FMOne type: #FmxSQLTWithColumnReference opposite: #outgoingColumnReferences',
		'#triggerStoredProceduresReferencing => FMOne type: #FmxSQLTriggerStoredProcedure opposite: #columnsReferenced'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLColumnReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ColumnReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLColumnReference >> column [
	"Relation named: #column type: #FmxSQLColumn opposite: #references"

	<ignoreForCoverage>
	<generated>
	<target>
	^ column
]

{ #category : 'accessing' }
FmxSQLColumnReference >> column: anObject [

	<ignoreForCoverage>
	<generated>
	column := anObject
]

{ #category : 'accessing' }
FmxSQLColumnReference >> foreignKeyConstraintSource [
	"Relation named: #foreignKeyConstraintSource type: #FmxSQLForeignKeyConstraint opposite: #outgoingForeignKeyColumnReferences"

	<ignoreForCoverage>
	<generated>
	<source>
	^ foreignKeyConstraintSource
]

{ #category : 'accessing' }
FmxSQLColumnReference >> foreignKeyConstraintSource: anObject [

	<ignoreForCoverage>
	<generated>
	foreignKeyConstraintSource := anObject
]

{ #category : 'accessing' }
FmxSQLColumnReference >> isCertain [

	<FMProperty: #isCertain type: #Boolean>
	<ignoreForCoverage>
	<generated>
	^ isCertain
]

{ #category : 'accessing' }
FmxSQLColumnReference >> isCertain: anObject [
	<ignoreForCoverage>
	<generated>
	isCertain := anObject
]

{ #category : 'testing' }
FmxSQLColumnReference >> isColumnReference [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLColumnReference >> isWildCardReference [

	<FMProperty: #isWildCardReference type: #Boolean>
	<ignoreForCoverage>
	<generated>
	^ isWildCardReference
]

{ #category : 'accessing' }
FmxSQLColumnReference >> isWildCardReference: anObject [
	<ignoreForCoverage>
	<generated>
	isWildCardReference := anObject
]

{ #category : 'accessing' }
FmxSQLColumnReference >> source [
	"Relation named: #source type: #FmxSQLTWithColumnReference opposite: #outgoingColumnReferences"

	<ignoreForCoverage>
	<generated>
	<source>
	^ source
]

{ #category : 'accessing' }
FmxSQLColumnReference >> source: anObject [

	<ignoreForCoverage>
	<generated>
	source := anObject
]

{ #category : 'accessing' }
FmxSQLColumnReference >> triggerStoredProceduresReferencing [
	"Relation named: #triggerStoredProceduresReferencing type: #FmxSQLTriggerStoredProcedure opposite: #columnsReferenced"

	<ignoreForCoverage>
	<generated>
	<container>
	^ triggerStoredProceduresReferencing
]

{ #category : 'accessing' }
FmxSQLColumnReference >> triggerStoredProceduresReferencing: anObject [

	<ignoreForCoverage>
	<generated>
	triggerStoredProceduresReferencing := anObject
]
