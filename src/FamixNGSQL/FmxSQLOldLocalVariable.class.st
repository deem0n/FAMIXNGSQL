"
I model the special OLD local variable accessible from inside trigger stored procedure.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLColumnsContainer` | `columnsContainer` | `FmxSQLTColumn` | |



"
Class {
	#name : 'FmxSQLOldLocalVariable',
	#superclass : 'FmxSQLLocalVariable',
	#traits : 'FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLColumnsContainer classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLOldLocalVariable class >> annotation [

	<ignoreForCoverage>
	<FMClass: #OldLocalVariable super: #FmxSQLLocalVariable>
	<package: #FamixNGSQL>
	<generated>
]
