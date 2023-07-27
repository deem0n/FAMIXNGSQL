Trait {
	#name : #FmxSQLTWithViewReference,
	#instVars : [
		'#outgoingViewReferences => FMMany type: #FmxSQLViewReference opposite: #source'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithViewReference classSide >> annotation [

	<FMClass: #TWithViewReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithViewReference >> addOutgoingViewReference: anObject [
	<generated>
	^ self outgoingViewReferences add: anObject
]

{ #category : #accessing }
FmxSQLTWithViewReference >> outgoingViewReferences [
	"Relation named: #outgoingViewReferences type: #FmxSQLViewReference opposite: #source"

	<generated>
	<derived>
	^ outgoingViewReferences
]

{ #category : #accessing }
FmxSQLTWithViewReference >> outgoingViewReferences: anObject [

	<generated>
	outgoingViewReferences value: anObject
]
