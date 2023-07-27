Trait {
	#name : #FmxSQLAbstractType,
	#instVars : [
		'#storedProceduresReturning => FMMany type: #FmxSQLStoredProcedure opposite: #returnType',
		'#localVariables => FMMany type: #FmxSQLLocalVariable opposite: #type',
		'#parameters => FMMany type: #FmxSQLParameter opposite: #type',
		'#cursorParameters => FMMany type: #FmxSQLCursorParameter opposite: #type'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLAbstractType classSide >> annotation [

	<FMClass: #AbstractType super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLAbstractType >> addCursorParameter: anObject [
	<generated>
	^ self cursorParameters add: anObject
]

{ #category : #adding }
FmxSQLAbstractType >> addLocalVariable: anObject [
	<generated>
	^ self localVariables add: anObject
]

{ #category : #adding }
FmxSQLAbstractType >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #adding }
FmxSQLAbstractType >> addStoredProceduresReturning: anObject [
	<generated>
	^ self storedProceduresReturning add: anObject
]

{ #category : #accessing }
FmxSQLAbstractType >> cursorParameters [
	"Relation named: #cursorParameters type: #FmxSQLCursorParameter opposite: #type"

	<generated>
	<derived>
	^ cursorParameters
]

{ #category : #accessing }
FmxSQLAbstractType >> cursorParameters: anObject [

	<generated>
	cursorParameters value: anObject
]

{ #category : #accessing }
FmxSQLAbstractType >> localVariables [
	"Relation named: #localVariables type: #FmxSQLLocalVariable opposite: #type"

	<generated>
	<derived>
	^ localVariables
]

{ #category : #accessing }
FmxSQLAbstractType >> localVariables: anObject [

	<generated>
	localVariables value: anObject
]

{ #category : #accessing }
FmxSQLAbstractType >> parameters [
	"Relation named: #parameters type: #FmxSQLParameter opposite: #type"

	<generated>
	<derived>
	^ parameters
]

{ #category : #accessing }
FmxSQLAbstractType >> parameters: anObject [

	<generated>
	parameters value: anObject
]

{ #category : #accessing }
FmxSQLAbstractType >> storedProceduresReturning [
	"Relation named: #storedProceduresReturning type: #FmxSQLStoredProcedure opposite: #returnType"

	<generated>
	<derived>
	^ storedProceduresReturning
]

{ #category : #accessing }
FmxSQLAbstractType >> storedProceduresReturning: anObject [

	<generated>
	storedProceduresReturning value: anObject
]
