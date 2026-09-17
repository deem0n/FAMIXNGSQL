"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `cursorParameters` | `FmxSQLAbstractType` | `type` | `FmxSQLCursorParameter` | |
| `localVariables` | `FmxSQLAbstractType` | `type` | `FmxSQLLocalVariable` | |
| `parameters` | `FmxSQLAbstractType` | `type` | `FmxSQLParameter` | |
| `storedProceduresReturning` | `FmxSQLAbstractType` | `returnType` | `FmxSQLStoredProcedure` | |



"
Trait {
	#name : 'FmxSQLAbstractType',
	#instVars : [
		'#cursorParameters => FMMany type: #FmxSQLCursorParameter opposite: #type',
		'#localVariables => FMMany type: #FmxSQLLocalVariable opposite: #type',
		'#parameters => FMMany type: #FmxSQLParameter opposite: #type',
		'#storedProceduresReturning => FMMany type: #FmxSQLStoredProcedure opposite: #returnType'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLAbstractType classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #AbstractType super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLAbstractType >> addCursorParameter: anObject [

	<ignoreForCoverage>
	<generated>
	^ self cursorParameters add: anObject
]

{ #category : 'adding' }
FmxSQLAbstractType >> addLocalVariable: anObject [

	<ignoreForCoverage>
	<generated>
	^ self localVariables add: anObject
]

{ #category : 'adding' }
FmxSQLAbstractType >> addParameter: anObject [

	<ignoreForCoverage>
	<generated>
	^ self parameters add: anObject
]

{ #category : 'adding' }
FmxSQLAbstractType >> addStoredProceduresReturning: anObject [

	<ignoreForCoverage>
	<generated>
	^ self storedProceduresReturning add: anObject
]

{ #category : 'accessing' }
FmxSQLAbstractType >> cursorParameters [
	"Relation named: #cursorParameters type: #FmxSQLCursorParameter opposite: #type"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ cursorParameters
]

{ #category : 'accessing' }
FmxSQLAbstractType >> cursorParameters: anObject [

	<ignoreForCoverage>
	<generated>
	cursorParameters value: anObject
]

{ #category : 'accessing' }
FmxSQLAbstractType >> localVariables [
	"Relation named: #localVariables type: #FmxSQLLocalVariable opposite: #type"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ localVariables
]

{ #category : 'accessing' }
FmxSQLAbstractType >> localVariables: anObject [

	<ignoreForCoverage>
	<generated>
	localVariables value: anObject
]

{ #category : 'accessing' }
FmxSQLAbstractType >> parameters [
	"Relation named: #parameters type: #FmxSQLParameter opposite: #type"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ parameters
]

{ #category : 'accessing' }
FmxSQLAbstractType >> parameters: anObject [

	<ignoreForCoverage>
	<generated>
	parameters value: anObject
]

{ #category : 'accessing' }
FmxSQLAbstractType >> storedProceduresReturning [
	"Relation named: #storedProceduresReturning type: #FmxSQLStoredProcedure opposite: #returnType"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ storedProceduresReturning
]

{ #category : 'accessing' }
FmxSQLAbstractType >> storedProceduresReturning: anObject [

	<ignoreForCoverage>
	<generated>
	storedProceduresReturning value: anObject
]
