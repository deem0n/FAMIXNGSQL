Trait {
	#name : #FmxSQLTWithTableReference,
	#instVars : [
		'#outgoingTableReferences => FMMany type: #FmxSQLTableReference opposite: #source'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithTableReference classSide >> annotation [

	<FMClass: #TWithTableReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithTableReference >> addOutgoingTableReference: anObject [
	<generated>
	^ self outgoingTableReferences add: anObject
]

{ #category : #accessing }
FmxSQLTWithTableReference >> outgoingTableReferences [
	"Relation named: #outgoingTableReferences type: #FmxSQLTableReference opposite: #source"

	<generated>
	<derived>
	^ outgoingTableReferences
]

{ #category : #accessing }
FmxSQLTWithTableReference >> outgoingTableReferences: anObject [

	<generated>
	outgoingTableReferences value: anObject
]
