Class {
	#name : #FmxSQLComment,
	#superclass : #FmxSQLSourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLComment class >> annotation [

	<FMClass: #Comment super: #FmxSQLSourcedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
