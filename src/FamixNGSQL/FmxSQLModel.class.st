Class {
	#name : 'FmxSQLModel',
	#superclass : 'MooseModel',
	#traits : 'FmxSQLTEntityCreator',
	#classTraits : 'FmxSQLTEntityCreator classTrait',
	#category : 'FamixNGSQL-Model',
	#package : 'FamixNGSQL',
	#tag : 'Model'
}

{ #category : 'accessing' }
FmxSQLModel class >> allSubmetamodelsPackagesNames [

	<ignoreForCoverage>
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
FmxSQLModel class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Model super: #MooseModel>
	<package: #FamixNGSQL>
	<generated>
]
