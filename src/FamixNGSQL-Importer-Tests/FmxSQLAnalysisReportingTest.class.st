Class {
	#name : #FmxSQLAnalysisReportingTest,
	#superclass : #TestCase,
	#category : #'FamixNGSQL-Importer-Tests'
}

{ #category : #tests }
FmxSQLAnalysisReportingTest >> testSourceAnchorCanBeExported [
	| model routine anchor serialized |
	model := FmxSQLModel new.
	FmxSQLStoredProcedure new name: 'synthetic'; isStub: true; mooseModel: model.
	routine := FmxSQLStoredProcedure new name: 'f'; source: 'SELECT 42'; mooseModel: model; yourself.
	anchor := FmxSQLEntitySourceAnchor new entity: routine; start: 8; end: 9; mooseModel: model; yourself.
	self assert: anchor sourceText equals: '42'.
	serialized := String streamContents: [ :stream | model exportToMSEStream: stream ].
	self assert: (serialized includesSubstring: 'SELECT 42').
	self assert: (serialized includesSubstring: 'EntitySourceAnchor')
]

{ #category : #tests }
FmxSQLAnalysisReportingTest >> testDetachedAnchorIsIncludedInMSERoundTrip [
	| model routine query anchor restored |
	model := FmxSQLModel new.
	routine := FmxSQLStoredProcedure new source: 'SELECT 1'; mooseModel: model; yourself.
	query := FmxSQLSelectQuery new container: routine; mooseModel: model; yourself.
	anchor := FmxSQLEntitySourceAnchor new entity: routine; start: 1; end: 8; yourself.
	query sourceAnchor: anchor.
	model ensureRelationMembers.
	self assert: anchor mooseModel identicalTo: model.
	restored := FmxSQLModel importFromMSEStream:
		(String streamContents: [ :stream | model exportToMSEStream: stream ]) readStream.
	self assert: restored size equals: model size.
	self assert: (restored allWithType: FmxSQLSelectQuery) anyOne sourceAnchor sourceText equals: 'SELECT 1'
]

{ #category : #tests }
FmxSQLAnalysisReportingTest >> testTimeoutPreservesSourceAndAllowsNextEntity [
	| builder slow next |
	builder := FmxSQLModelBuilder new analysisTimeout: 10 milliSeconds.
	slow := FmxSQLStoredProcedure new source: 'original source'.
	next := FmxSQLStoredProcedure new.
	self assert: (builder analyse: slow during: [ Semaphore new wait ]) equals: #timedOut.
	self assert: slow source equals: 'original source'.
	self assert: (slow cacheAt: #analysisDiagnostics) size equals: 1.
	self assert: (builder analyse: next during: [ 1 + 1 ]) equals: #visited.
	self assert: (next cacheAt: #analysisDiagnostics) isEmpty
]

{ #category : #tests }
FmxSQLAnalysisReportingTest >> testWarningsMarkPartialAnalysisAndResume [
	| builder entity resumed |
	builder := FmxSQLModelBuilder new.
	entity := FmxSQLStoredProcedure new.
	resumed := false.
	self assert: (builder analyse: entity during: [ Warning signal: 'unresolved'. resumed := true ]) equals: #partial.
	self assert: resumed.
	self assert: builder errorReport warnings size equals: 1.
	self assert: (entity cacheAt: #analysisDiagnostics) first second equals: 'unresolved'
]

{ #category : #tests }
FmxSQLAnalysisReportingTest >> testFailureIsAttributedToItsEntity [
	| builder entity |
	builder := FmxSQLModelBuilder new.
	entity := FmxSQLStoredProcedure new.
	self assert: (builder analyse: entity during: [ Error signal: 'analysis failed' ]) equals: #failed.
	self assert: (entity cacheAt: #analysisStatus ifAbsent: [ nil ]) equals: #failed.
	self assert: (entity cacheAt: #analysisDiagnostics) first second equals: 'analysis failed'
]

{ #category : #tests }
FmxSQLAnalysisReportingTest >> testQueryRelationsSurviveMSERoundTripWithoutDuplicateEntities [
	| model view derived viewQuery derivedQuery serialized restored |
	model := FmxSQLModel new.
	view := FmxSQLView new name: 'v'; source: 'SELECT 1'; mooseModel: model; yourself.
	derived := FmxSQLDerivedTable new mooseModel: model; yourself.
	viewQuery := FmxSQLSelectQuery new mooseModel: model; yourself.
	derivedQuery := FmxSQLSelectQuery new mooseModel: model; yourself.
	view sqlQuery: viewQuery.
	derived sqlQuery: derivedQuery.
	self assert: viewQuery viewDefining identicalTo: view.
	self assert: derivedQuery derivedTableDefining identicalTo: derived.
	serialized := String streamContents: [ :stream | model exportToMSEStream: stream ].
	restored := FmxSQLModel importFromMSEStream: serialized readStream.
	self assert: restored size equals: model size.
	self assert: (restored allWithType: FmxSQLSelectQuery) size equals: 2.
	self assert: (restored allWithType: FmxSQLView) anyOne sqlQuery viewDefining identicalTo: (restored allWithType: FmxSQLView) anyOne.
	self assert: (restored allWithType: FmxSQLDerivedTable) anyOne sqlQuery derivedTableDefining identicalTo: (restored allWithType: FmxSQLDerivedTable) anyOne
]
