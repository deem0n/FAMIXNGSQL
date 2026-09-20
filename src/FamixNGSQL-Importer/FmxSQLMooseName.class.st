"Canonical SQL catalog names. Display names remain untouched.
Non-catalog AST names are readable but do not claim global uniqueness."
Class {
	#name : #FmxSQLMooseName,
	#superclass : #Object,
	#category : #'FamixNGSQL-Importer'
}
{ #category : #naming }
FmxSQLMooseName class >> quoted: aName [
	^ '"', ((aName ifNil: [ '' ]) asString copyReplaceAll: '"' with: '""'), '"'
]
{ #category : #naming }
FmxSQLMooseName class >> ownerOf: entity [
	#(columnsContainer table parentBehaviouralEntity parentNamespace) do: [ :selector |
		(entity respondsTo: selector) ifTrue: [
			(entity perform: selector) ifNotNil: [ :owner | ^ owner ] ] ].
	^ nil
]
{ #category : #naming }
FmxSQLMooseName class >> pathFor: entity [
	^ self pathFor: entity visited: IdentitySet new
]
{ #category : #naming }
FmxSQLMooseName class >> pathFor: entity visited: visited [
	| owner prefix result |
	(visited includes: entity) ifTrue: [ ^ '<cyclic-owner>' ].
	visited add: entity.
	owner := self ownerOf: entity.
	prefix := owner ifNil: [ '' ] ifNotNil: [ (self pathFor: owner visited: visited), '.' ].
	result := prefix, (self quoted: entity name).
	(entity isKindOf: FmxSQLStoredProcedure) ifTrue: [
		result := result, '(', (((self inputParametersOf: entity) collect: [ :parameter |
			parameter type ifNil: [ '?' ] ifNotNil: [ :type | self pathFor: type ] ]) joinUsing: ','), ')' ].
	^ result
]
{ #category : #naming }
FmxSQLMooseName class >> inputParametersOf: routine [
	^ (routine parameters reject: [ :parameter | #('o' 't' 'OUT' 'TABLE') includes: parameter mode ])
		sorted: [ :a :b | (a position ifNil: [ 0 ]) < (b position ifNil: [ 0 ]) ]
]
{ #category : #naming }
FmxSQLMooseName class >> nameFor: entity [
	"The entity kind separates PostgreSQL's independent naming domains, e.g. a table and its row type."
	| kind |
	kind := (entity isKindOf: FmxSQLStoredProcedure)
		ifTrue: [ 'Routine' ] ifFalse: [ entity class name allButFirst: 'FmxSQL' size ].
	^ kind, ':', (self pathFor: entity)
]
{ #category : #testing }
FmxSQLMooseName class >> isUniqueFor: entity [
	^ self isUniqueFor: entity visited: IdentitySet new
]
{ #category : #testing }
FmxSQLMooseName class >> isUniqueFor: entity visited: visited [
	| owner catalogEntity |
	(visited includes: entity) ifTrue: [ ^ false ].
	visited add: entity.
	(entity name isNil or: [ entity name isEmpty ]) ifTrue: [ ^ false ].
	(entity isKindOf: FmxSQLNamespace) ifTrue: [ ^ true ].
	catalogEntity := { FmxSQLTable. FmxSQLForeignTable. FmxSQLView. FmxSQLType.
		FmxSQLColumn. FmxSQLTrigger. FmxSQLStoredProcedure. FmxSQLConstraint }
		anySatisfy: [ :class | entity isKindOf: class ].
	(catalogEntity not or: [ entity isKindOf: FmxSQLNotNullConstraint ]) ifTrue: [ ^ false ].
	(entity isKindOf: FmxSQLStoredProcedure) ifTrue: [
		((self inputParametersOf: entity) allSatisfy: [ :p |
			p position isInteger and: [ p type notNil and: [ self isUniqueFor: p type ] ] ]) ifFalse: [ ^ false ] ].
	owner := self ownerOf: entity.
	^ owner notNil and: [ self isUniqueFor: owner visited: visited ]
]
