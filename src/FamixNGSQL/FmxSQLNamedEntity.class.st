Class {
	#name : #FmxSQLNamedEntity,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
