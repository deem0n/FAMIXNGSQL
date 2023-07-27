"
I am a namespace. I hold entities to define a name scope where name duplicates are forbidden.
"
Class {
	#name : #FmxSQLNamespace,
	#superclass : #FmxSQLStructuralEntity,
	#traits : 'FamixTNamespace',
	#classTraits : 'FamixTNamespace classTrait',
	#instVars : [
		'#references => FMMany type: #FmxSQLNamespaceReference opposite: #namespace'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLNamespace class >> annotation [

	<FMClass: #Namespace super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLNamespace >> addReference: anObject [
	<generated>
	^ self references add: anObject
]

{ #category : #accessing }
FmxSQLNamespace >> references [
	"Relation named: #references type: #FmxSQLNamespaceReference opposite: #namespace"

	<generated>
	<derived>
	^ references
]

{ #category : #accessing }
FmxSQLNamespace >> references: anObject [

	<generated>
	references value: anObject
]
