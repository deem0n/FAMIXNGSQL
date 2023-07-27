Trait {
	#name : #FmxSQLTWithCursorReference,
	#instVars : [
		'#outgoingCursorReferences => FMMany type: #FmxSQLCursorReference opposite: #source'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithCursorReference classSide >> annotation [

	<FMClass: #TWithCursorReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithCursorReference >> addOutgoingCursorReference: anObject [
	<generated>
	^ self outgoingCursorReferences add: anObject
]

{ #category : #accessing }
FmxSQLTWithCursorReference >> outgoingCursorReferences [
	"Relation named: #outgoingCursorReferences type: #FmxSQLCursorReference opposite: #source"

	<generated>
	<derived>
	^ outgoingCursorReferences
]

{ #category : #accessing }
FmxSQLTWithCursorReference >> outgoingCursorReferences: anObject [

	<generated>
	outgoingCursorReferences value: anObject
]
