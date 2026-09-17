"
I model the special NEW local variable accessible from inside trigger stored procedure.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `columns` | `FmxSQLColumnsContainer` | `columnsContainer` | `FmxSQLTColumn` | |



"
Class {
	#name : 'FmxSQLNewLocalVariable',
	#superclass : 'FmxSQLLocalVariable',
	#traits : 'FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLColumnsContainer classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLNewLocalVariable class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NewLocalVariable super: #FmxSQLLocalVariable>
	<package: #FamixNGSQL>
	<generated>
]
