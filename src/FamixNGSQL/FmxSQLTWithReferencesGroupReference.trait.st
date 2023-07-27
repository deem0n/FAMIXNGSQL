Trait {
	#name : #FmxSQLTWithReferencesGroupReference,
	#instVars : [
		'#outgoingReferencesGroupReferences => FMMany type: #FmxSQLTReferencesGroupReference opposite: #source'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithReferencesGroupReference classSide >> annotation [

	<FMClass: #TWithReferencesGroupReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithReferencesGroupReference >> addOutgoingReferencesGroupReference: anObject [
	<generated>
	^ self outgoingReferencesGroupReferences add: anObject
]

{ #category : #accessing }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferences [
	"Relation named: #outgoingReferencesGroupReferences type: #FmxSQLTReferencesGroupReference opposite: #source"

	<generated>
	<derived>
	^ outgoingReferencesGroupReferences
]

{ #category : #accessing }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferences: anObject [

	<generated>
	outgoingReferencesGroupReferences value: anObject
]

{ #category : #navigation }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferencesGroup [
	<generated>
	<navigation: 'OutgoingReferencesGroupReferences'>
	^ MooseSpecializedGroup withAll: self outgoingReferencesGroupReferences asSet
]
