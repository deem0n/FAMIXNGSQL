Trait {
	#name : #FmxSQLTWithQualifiedReference,
	#instVars : [
		'#qualifiedReference => FMOne type: #FmxSQLQualifiedReference opposite: #references'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithQualifiedReference classSide >> annotation [

	<FMClass: #TWithQualifiedReference super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithQualifiedReference >> qualifiedReference [
	"Relation named: #qualifiedReference type: #FmxSQLQualifiedReference opposite: #references"

	<generated>
	^ qualifiedReference
]

{ #category : #accessing }
FmxSQLTWithQualifiedReference >> qualifiedReference: anObject [

	<generated>
	qualifiedReference := anObject
]
