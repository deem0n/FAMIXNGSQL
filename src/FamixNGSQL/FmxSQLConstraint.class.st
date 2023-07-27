"
I am an abstract superclass for constraints. A constraint restrict the possible values that can be stored in a column of a table.
"
Class {
	#name : #FmxSQLConstraint,
	#superclass : #FmxSQLStructuralEntity,
	#traits : 'FmxSQLTWithColumnReference',
	#classTraits : 'FmxSQLTWithColumnReference classTrait',
	#instVars : [
		'#table => FMOne type: #FmxSQLTable opposite: #constraints'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLConstraint class >> annotation [

	<FMClass: #Constraint super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLConstraint >> isConstraint [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLConstraint >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #constraints"

	<generated>
	<container>
	^ table
]

{ #category : #accessing }
FmxSQLConstraint >> table: anObject [

	<generated>
	table := anObject
]

{ #category : #navigation }
FmxSQLConstraint >> tableGroup [
	<generated>
	<navigation: 'Table'>
	^ MooseSpecializedGroup with: self table
]
