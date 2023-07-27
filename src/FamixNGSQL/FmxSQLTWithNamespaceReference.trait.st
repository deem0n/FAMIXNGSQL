Trait {
	#name : #FmxSQLTWithNamespaceReference,
	#instVars : [
		'#outgoingNamespaceReference => FMMany type: #FmxSQLNamespaceReference opposite: #source'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithNamespaceReference classSide >> annotation [

	<FMClass: #TWithNamespaceReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithNamespaceReference >> addOutgoingNamespaceReference: anObject [
	<generated>
	^ self outgoingNamespaceReference add: anObject
]

{ #category : #accessing }
FmxSQLTWithNamespaceReference >> outgoingNamespaceReference [
	"Relation named: #outgoingNamespaceReference type: #FmxSQLNamespaceReference opposite: #source"

	<generated>
	<derived>
	^ outgoingNamespaceReference
]

{ #category : #accessing }
FmxSQLTWithNamespaceReference >> outgoingNamespaceReference: anObject [

	<generated>
	outgoingNamespaceReference value: anObject
]
