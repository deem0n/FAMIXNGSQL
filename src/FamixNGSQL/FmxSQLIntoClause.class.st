"
I am an into clause
"
Class {
	#name : #FmxSQLIntoClause,
	#superclass : #FmxSQLClause,
	#traits : 'FmxSQLTWithColumnReference + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference',
	#classTraits : 'FmxSQLTWithColumnReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLIntoClause class >> annotation [

	<FMClass: #IntoClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]
