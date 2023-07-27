Trait {
	#name : #FmxSQLTWithColumnReference,
	#instVars : [
		'#outgoingColumnReferences => FMMany type: #FmxSQLColumnReference opposite: #source'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithColumnReference classSide >> annotation [

	<FMClass: #TWithColumnReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithColumnReference >> addOutgoingColumnReference: anObject [
	<generated>
	^ self outgoingColumnReferences add: anObject
]

{ #category : #accessing }
FmxSQLTWithColumnReference >> outgoingColumnReferences [
	"Relation named: #outgoingColumnReferences type: #FmxSQLColumnReference opposite: #source"

	<generated>
	<derived>
	^ outgoingColumnReferences
]

{ #category : #accessing }
FmxSQLTWithColumnReference >> outgoingColumnReferences: anObject [

	<generated>
	outgoingColumnReferences value: anObject
]
