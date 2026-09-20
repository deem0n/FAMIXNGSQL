Class {
	#name : #FmxSQLMooseNameTest,
	#superclass : #TestCase,
	#category : #'FamixNGSQL-Importer-Tests'
}
{ #category : #tests }
FmxSQLMooseNameTest >> testSchemasAndLookup [
	| model a b one two |
	model := FmxSQLModel new.
	one := FmxSQLNamespace new name: 'one'; mooseModel: model; yourself.
	two := FmxSQLNamespace new name: 'two'; mooseModel: model; yourself.
	a := FmxSQLTable new name: 'same'; parentNamespace: one; mooseModel: model; yourself.
	b := FmxSQLTable new name: 'same'; parentNamespace: two; mooseModel: model; yourself.
	self assert: a mooseName equals: 'Table:"one"."same"'.
	self deny: a mooseName equals: b mooseName.
	self assert: (model entityNamed: a mooseName) identicalTo: a.
	self assert: (model entityNamed: b mooseName) identicalTo: b
]
{ #category : #tests }
FmxSQLMooseNameTest >> testOwnersQuotingAndChanges [
	| namespace table column |
	namespace := FmxSQLNamespace new name: 'a.b'; yourself.
	table := FmxSQLTable new name: 'a"b'; parentNamespace: namespace; yourself.
	column := FmxSQLColumn new name: 'id'; columnsContainer: table; yourself.
	self assert: column mooseName equals: 'Column:"a.b"."a""b"."id"'.
	namespace name: 'new'.
	self assert: column mooseName equals: 'Column:"new"."a""b"."id"'.
	table parentNamespace: (FmxSQLNamespace new name: 'other'; yourself).
	self assert: column mooseName equals: 'Column:"other"."a""b"."id"'.
	self assert: column name equals: 'id'
]
{ #category : #tests }
FmxSQLMooseNameTest >> testTableAndTypeNamingDomains [
	| namespace table type |
	namespace := FmxSQLNamespace new name: 'public'; yourself.
	table := FmxSQLTable new name: 'record'; parentNamespace: namespace; yourself.
	type := FmxSQLType new name: 'record'; parentNamespace: namespace; yourself.
	self assert: table hasUniqueMooseNameInModel; assert: type hasUniqueMooseNameInModel.
	self deny: table mooseName equals: type mooseName
]
{ #category : #tests }
FmxSQLMooseNameTest >> testOverloadsExcludeOutputParameters [
	| namespace integer text routine other |
	namespace := FmxSQLNamespace new name: 'public'; yourself.
	integer := FmxSQLType new name: 'int4'; parentNamespace: namespace; yourself.
	text := FmxSQLType new name: 'text'; parentNamespace: namespace; yourself.
	routine := FmxSQLStoredProcedure new name: 'f'; parentNamespace: namespace; yourself.
	other := FmxSQLStoredProcedure new name: 'f'; parentNamespace: namespace; yourself.
	FmxSQLParameter new name: 'input'; position: 1; mode: 'i'; type: integer; parentBehaviouralEntity: routine.
	FmxSQLParameter new name: 'output'; position: 2; mode: 'o'; type: text; parentBehaviouralEntity: routine.
	FmxSQLParameter new name: 'input'; position: 1; mode: 'b'; type: text; parentBehaviouralEntity: other.
	self assert: routine mooseName equals: 'Routine:"public"."f"("public"."int4")'.
	self deny: routine mooseName equals: other mooseName.
	self assert: routine hasUniqueMooseNameInModel
]
{ #category : #tests }
FmxSQLMooseNameTest >> testUnscopedAndLocalNamesDoNotClaimUniqueness [
	self deny: (FmxSQLTable new name: 'unscoped'; yourself) hasUniqueMooseNameInModel.
	self deny: (FmxSQLLocalVariable new name: 'repeated'; yourself) hasUniqueMooseNameInModel
]
{ #category : #tests }
FmxSQLMooseNameTest >> testRoundTrip [
	| model namespace table restored name |
	model := FmxSQLModel new.
	namespace := FmxSQLNamespace new name: 'example'; mooseModel: model; yourself.
	table := FmxSQLTable new name: 'items'; parentNamespace: namespace; mooseModel: model; yourself.
	name := table mooseName.
	restored := FmxSQLModel importFromMSEStream:
		(String streamContents: [ :stream | model exportToMSEStream: stream ]) readStream.
	self assert: (restored entityNamed: name) class equals: FmxSQLTable.
	self assert: (restored entityNamed: name) name equals: 'items'
]
