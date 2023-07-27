Class {
	#name : #FmxSQLSourcedEntity,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
