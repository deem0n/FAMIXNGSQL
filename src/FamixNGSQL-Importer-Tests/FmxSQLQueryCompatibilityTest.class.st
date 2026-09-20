Class {
	#name : #FmxSQLQueryCompatibilityTest,
	#superclass : #TestCase,
	#category : #'FamixNGSQL-Importer-Tests'
}

{ #category : #tests }
FmxSQLQueryCompatibilityTest >> testSQLAccessorsLeaveMooseQueryAvailable [
	| model sqlQuery view derived clause cursor |
	model := FmxSQLModel new.
	sqlQuery := FmxSQLSelectQuery new mooseModel: model; yourself.
	view := FmxSQLView new sqlQuery: sqlQuery; mooseModel: model; yourself.
	derived := FmxSQLDerivedTable new sqlQuery: sqlQuery; mooseModel: model; yourself.
	clause := FmxSQLSelectClause new sqlQuery: sqlQuery; mooseModel: model; yourself.
	cursor := FmxSQLCursor new mooseModel: model; yourself.
	cursor addQuery: sqlQuery.
	{ view. derived. clause. cursor } do: [ :entity |
		self assert: entity sqlQuery identicalTo: sqlQuery.
		self assert: (entity query isKindOf: MooseQuery).
		self assert: (entity queryLocal: #in with: FmxSQLTableReference) isEmpty ]
]

{ #category : #tests }
FmxSQLQueryCompatibilityTest >> testOppositesUpdateWhenSQLQueryChanges [
	| first second view derived clause |
	first := FmxSQLSelectQuery new.
	second := FmxSQLSelectQuery new.
	view := FmxSQLView new sqlQuery: first; yourself.
	derived := FmxSQLDerivedTable new sqlQuery: first; yourself.
	clause := FmxSQLWhereClause new sqlQuery: first; yourself.
	self assert: first viewDefining identicalTo: view.
	self assert: first derivedTableDefining identicalTo: derived.
	self assert: (first clauses includes: clause).
	view sqlQuery: second.
	derived sqlQuery: second.
	clause sqlQuery: second.
	self assert: first viewDefining isNil.
	self assert: first derivedTableDefining isNil.
	self deny: (first clauses includes: clause).
	self assert: second viewDefining identicalTo: view.
	self assert: second derivedTableDefining identicalTo: derived.
	self assert: (second clauses includes: clause)
]

{ #category : #tests }
FmxSQLQueryCompatibilityTest >> testMooseNavigationFindsClauseDependencies [
	| model view sqlQuery clause table |
	model := FmxSQLModel new.
	view := FmxSQLView new mooseModel: model; yourself.
	sqlQuery := FmxSQLSelectQuery new viewDefining: view; mooseModel: model; yourself.
	clause := FmxSQLFromClause new sqlQuery: sqlQuery; mooseModel: model; yourself.
	table := FmxSQLTable new mooseModel: model; yourself.
	FmxSQLTableReference new source: clause; table: table; mooseModel: model; yourself.
	self assert: (clause queryLocal: #out with: FmxSQLTableReference) size equals: 1.
	self assert: (view queryLocal: #in with: FmxSQLViewReference) isEmpty.
	self assert: (table queryLocal: #in with: FmxSQLTableReference) size equals: 1.
	self assert: (view containedEntities includes: sqlQuery).
	self assert: (sqlQuery containedEntities includes: clause)
]

{ #category : #tests }
FmxSQLQueryCompatibilityTest >> testSQLQueryRelationsSurviveMSERoundTrip [
	| model view derived clause sqlQuery serialized restored |
	model := FmxSQLModel new.
	sqlQuery := FmxSQLSelectQuery new mooseModel: model; yourself.
	view := FmxSQLView new name: 'v'; source: 'SELECT 1'; sqlQuery: sqlQuery; mooseModel: model; yourself.
	derived := FmxSQLDerivedTable new sqlQuery: sqlQuery; mooseModel: model; yourself.
	clause := FmxSQLSelectClause new sqlQuery: sqlQuery; mooseModel: model; yourself.
	serialized := String streamContents: [ :stream | model exportToMSEStream: stream ].
	self assert: (serialized includesSubstring: '(sqlQuery (ref:').
	self deny: (serialized includesSubstring: '(query (ref:').
	restored := FmxSQLModel importFromMSEStream: serialized readStream.
	self assert: restored size equals: 4.
	sqlQuery := (restored allWithType: FmxSQLSelectQuery) anyOne.
	view := (restored allWithType: FmxSQLView) anyOne.
	derived := (restored allWithType: FmxSQLDerivedTable) anyOne.
	clause := (restored allWithType: FmxSQLSelectClause) anyOne.
	self assert: view sqlQuery identicalTo: sqlQuery.
	self assert: derived sqlQuery identicalTo: sqlQuery.
	self assert: clause sqlQuery identicalTo: sqlQuery.
	self assert: sqlQuery viewDefining identicalTo: view.
	self assert: sqlQuery derivedTableDefining identicalTo: derived.
	self assert: (sqlQuery clauses includes: clause)
]
