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
