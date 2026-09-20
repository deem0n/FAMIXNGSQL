Class {
	#name : #FmxSQLV3NavigationAcceptanceTest,
	#superclass : #TestCase,
	#category : #'FamixNGSQL-Importer-Tests'
}
{ #category : #tests }
FmxSQLV3NavigationAcceptanceTest >> testViewDependencyTraversal [
	| model view query clause table reference |
	model := FmxSQLModel new.
	view := FmxSQLView new name: 'example'; mooseModel: model; yourself.
	query := FmxSQLSelectQuery new viewDefining: view; mooseModel: model; yourself.
	clause := FmxSQLFromClause new sqlQuery: query; mooseModel: model; yourself.
	table := FmxSQLTable new name: 'records'; mooseModel: model; yourself.
	reference := FmxSQLTableReference new source: clause; table: table; mooseModel: model; yourself.
	self assert: (view queryAllOutgoing includes: reference).
	self assert: (view allProviders includes: table).
	self assert: view hasOutgoing.
	self deny: view hasLocalOutgoing.
	self assert: (table allClients includes: clause)
]
