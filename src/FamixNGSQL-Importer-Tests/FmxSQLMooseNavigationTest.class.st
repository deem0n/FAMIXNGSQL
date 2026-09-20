Class {
	#name : #FmxSQLMooseNavigationTest,
	#superclass : #TestCase,
	#category : #'FamixNGSQL-Importer-Tests'
}

{ #category : #tests }
FmxSQLMooseNavigationTest >> testReferencesSupportContainmentQueries [
	| model call argument group |
	model := FmxSQLModel new.
	call := FmxSQLStoredProcedureCall new mooseModel: model; yourself.
	argument := FmxSQLColumnReference new storedProcedureContainer: call; mooseModel: model; yourself.
	group := FmxSQLReferencesGroup new mooseModel: model; yourself.
	group addReference: call.
	self assert: (group containedEntities includes: call).
	self assert: (call containedEntities includes: argument).
	{ group. call. argument } do: [ :entity |
		self assert: entity isQueryable.
		self assert: (entity query isKindOf: MooseQuery).
		self assert: (entity queryLocal: #in with: FmxSQLColumnReference) isEmpty ]
]

{ #category : #tests }
FmxSQLMooseNavigationTest >> testNamespaceDiscoversAssociationTypesThroughReferences [
	| types |
	types := FmxSQLNamespace allIncomingAssociationTypesIn: FmxSQLModel metamodel.
	self assert: (types includes: FmxSQLColumnReference).
	self assert: (types includes: FmxSQLTableReference).
	self assert: (types includes: FmxSQLViewReference).
	self assert: (types includes: FamixTInvocation)
]

{ #category : #tests }
FmxSQLMooseNavigationTest >> testAllContainedTypesSupportAssociationDiscovery [
	| metamodel classes |
	metamodel := FmxSQLModel metamodel.
	classes := (FmxSQLNamespace allContainedEntityTypesIn: metamodel)
		flatCollectAsSet: [ :type | type implementingClassesIn: metamodel ].
	classes do: [ :class |
		self assert: (class respondsTo: #incomingAssociationTypesIn:).
		self assert: (class incomingAssociationTypesIn: metamodel) isCollection ]
]

{ #category : #tests }
FmxSQLMooseNavigationTest >> testStandardArchitecturalMapIncludesSQLBodyDependency [
	"The Moose CI image exercises the real map without custom models or builders.
	The plain Pharo CI image intentionally does not load the Moose UI."
	| browserClass builderClass canvasClass model sourceSchema targetSchema view sqlQuery clause table canvas browser |
	browserClass := Smalltalk globals at: #MiArchitecturalMapBrowser ifAbsent: [ self skip ].
	builderClass := Smalltalk globals at: #MiArchitecturalMapBuilder.
	canvasClass := Smalltalk globals at: #RSCanvas.
	model := FmxSQLModel new.
	sourceSchema := FmxSQLNamespace new name: 'reporting'; mooseModel: model; yourself.
	targetSchema := FmxSQLNamespace new name: 'data'; mooseModel: model; yourself.
	view := FmxSQLView new name: 'report'; parentNamespace: sourceSchema; mooseModel: model; yourself.
	sqlQuery := FmxSQLSelectQuery new viewDefining: view; mooseModel: model; yourself.
	clause := FmxSQLFromClause new sqlQuery: sqlQuery; mooseModel: model; yourself.
	table := FmxSQLTable new name: 'records'; parentNamespace: targetSchema; mooseModel: model; yourself.
	FmxSQLTableReference new source: clause; table: table; mooseModel: model.
	browser := browserClass new.
	browser specModel entities: { sourceSchema. targetSchema } asMooseGroup.
	canvas := canvasClass new.
	builderClass new mapModel: browser specModel; container: canvas; build.
	self assert: canvas nodes size equals: 2.
	self assert: canvas edges size equals: 1
]
