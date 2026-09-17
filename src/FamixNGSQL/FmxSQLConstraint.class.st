"
I am an abstract superclass for constraints. A constraint restrict the possible values that can be stored in a column of a table.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `table` | `FmxSQLConstraint` | `constraints` | `FmxSQLTable` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingColumnReferences` | `FmxSQLTWithColumnReference` | `source` | `FmxSQLColumnReference` | |



"
Class {
	#name : 'FmxSQLConstraint',
	#superclass : 'FmxSQLStructuralEntity',
	#traits : 'FmxSQLTWithColumnReference',
	#classTraits : 'FmxSQLTWithColumnReference classTrait',
	#instVars : [
		'#table => FMOne type: #FmxSQLTable opposite: #constraints'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLConstraint class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Constraint super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'testing' }
FmxSQLConstraint >> isConstraint [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLConstraint >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #constraints"

	<ignoreForCoverage>
	<generated>
	<container>
	^ table
]

{ #category : 'accessing' }
FmxSQLConstraint >> table: anObject [

	<ignoreForCoverage>
	<generated>
	table := anObject
]
