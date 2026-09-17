"
I am local variable of type record. I can contain columns. These columns are set when a SELECT INTO is encountered.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLColumnsContainer` | `columnsContainer` | `FmxSQLTColumn` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `queryBoundTo` | `FmxSQLRecordLocalVariable` | `recordLocalVariables` | `FmxSQLSelectQuery` | |



"
Class {
	#name : 'FmxSQLRecordLocalVariable',
	#superclass : 'FmxSQLLocalVariable',
	#traits : 'FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLColumnsContainer classTrait',
	#instVars : [
		'#queryBoundTo => FMOne type: #FmxSQLSelectQuery opposite: #recordLocalVariables'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLRecordLocalVariable class >> annotation [

	<ignoreForCoverage>
	<FMClass: #RecordLocalVariable super: #FmxSQLLocalVariable>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'accessing' }
FmxSQLRecordLocalVariable >> queryBoundTo [
	"Relation named: #queryBoundTo type: #FmxSQLSelectQuery opposite: #recordLocalVariables"

	<ignoreForCoverage>
	<generated>
	^ queryBoundTo
]

{ #category : 'accessing' }
FmxSQLRecordLocalVariable >> queryBoundTo: anObject [

	<ignoreForCoverage>
	<generated>
	queryBoundTo := anObject
]
