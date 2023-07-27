"
I represent a Table in the relational model.
"
Class {
	#name : #FmxSQLTable,
	#superclass : #FmxSQLStructuralEntity,
	#traits : 'FmxSQLAbstractType + FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLAbstractType classTrait + FmxSQLColumnsContainer classTrait',
	#instVars : [
		'#constraints => FMMany type: #FmxSQLConstraint opposite: #table',
		'#superTable => FMOne type: #FmxSQLTable opposite: #subTables',
		'#subTables => FMMany type: #FmxSQLTable opposite: #superTable',
		'#references => FMMany type: #FmxSQLTableReference opposite: #table',
		'#triggers => FMMany type: #FmxSQLTrigger opposite: #table',
		'#updateQueries => FMMany type: #FmxSQLUpdateQuery opposite: #table'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLTable class >> annotation [

	<FMClass: #Table super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTable >> addConstraint: anObject [
	<generated>
	^ self constraints add: anObject
]

{ #category : #adding }
FmxSQLTable >> addReference: anObject [
	<generated>
	^ self references add: anObject
]

{ #category : #adding }
FmxSQLTable >> addSubTable: anObject [
	<generated>
	^ self subTables add: anObject
]

{ #category : #adding }
FmxSQLTable >> addTrigger: anObject [
	<generated>
	^ self triggers add: anObject
]

{ #category : #adding }
FmxSQLTable >> addUpdateQuery: anObject [
	<generated>
	^ self updateQueries add: anObject
]

{ #category : #accessing }
FmxSQLTable >> constraints [
	"Relation named: #constraints type: #FmxSQLConstraint opposite: #table"

	<generated>
	<derived>
	^ constraints
]

{ #category : #accessing }
FmxSQLTable >> constraints: anObject [

	<generated>
	constraints value: anObject
]

{ #category : #navigation }
FmxSQLTable >> constraintsGroup [
	<generated>
	<navigation: 'Constraints'>
	^ MooseSpecializedGroup withAll: self constraints asSet
]

{ #category : #accessing }
FmxSQLTable >> references [
	"Relation named: #references type: #FmxSQLTableReference opposite: #table"

	<generated>
	<derived>
	^ references
]

{ #category : #accessing }
FmxSQLTable >> references: anObject [

	<generated>
	references value: anObject
]

{ #category : #accessing }
FmxSQLTable >> subTables [
	"Relation named: #subTables type: #FmxSQLTable opposite: #superTable"

	<generated>
	<derived>
	^ subTables
]

{ #category : #accessing }
FmxSQLTable >> subTables: anObject [

	<generated>
	subTables value: anObject
]

{ #category : #accessing }
FmxSQLTable >> superTable [
	"Relation named: #superTable type: #FmxSQLTable opposite: #subTables"

	<generated>
	^ superTable
]

{ #category : #accessing }
FmxSQLTable >> superTable: anObject [

	<generated>
	superTable := anObject
]

{ #category : #accessing }
FmxSQLTable >> triggers [
	"Relation named: #triggers type: #FmxSQLTrigger opposite: #table"

	<generated>
	<derived>
	^ triggers
]

{ #category : #accessing }
FmxSQLTable >> triggers: anObject [

	<generated>
	triggers value: anObject
]

{ #category : #navigation }
FmxSQLTable >> triggersGroup [
	<generated>
	<navigation: 'Triggers'>
	^ MooseSpecializedGroup withAll: self triggers asSet
]

{ #category : #accessing }
FmxSQLTable >> updateQueries [
	"Relation named: #updateQueries type: #FmxSQLUpdateQuery opposite: #table"

	<generated>
	<derived>
	^ updateQueries
]

{ #category : #accessing }
FmxSQLTable >> updateQueries: anObject [

	<generated>
	updateQueries value: anObject
]
