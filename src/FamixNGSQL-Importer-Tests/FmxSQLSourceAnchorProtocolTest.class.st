Class {
	#name : #FmxSQLSourceAnchorProtocolTest,
	#superclass : #TestCase,
	#category : #'FamixNGSQL-Importer-Tests'
}

{ #category : #tests }
FmxSQLSourceAnchorProtocolTest >> testValidInterval [
	| anchor |
	anchor := FmxSQLEntitySourceAnchor new
		entity: (FmxSQLStoredProcedure new source: 'SELECT 42'); start: 8; end: 9; yourself.
	self assert: anchor knowsStart.
	self assert: anchor knowsEnd.
	self assert: anchor hasSource.
	self assert: anchor sourceText equals: '42'
]

{ #category : #tests }
FmxSQLSourceAnchorProtocolTest >> testMissingSource [
	| anchor |
	anchor := FmxSQLEntitySourceAnchor new start: 1; end: 1; yourself.
	self deny: anchor knowsStart; deny: anchor knowsEnd; deny: anchor hasSource.
	anchor entity: FmxSQLStoredProcedure new.
	self deny: anchor knowsStart; deny: anchor knowsEnd; deny: anchor hasSource.
	anchor entity source: ''.
	self deny: anchor knowsStart; deny: anchor knowsEnd; deny: anchor hasSource
]

{ #category : #tests }
FmxSQLSourceAnchorProtocolTest >> testPartialAndInvalidIntervals [
	| anchor |
	anchor := FmxSQLEntitySourceAnchor new entity: (FmxSQLStoredProcedure new source: 'SELECT 42'); yourself.
	anchor start: 1.
	self assert: anchor knowsStart; deny: anchor knowsEnd; deny: anchor hasSource.
	anchor start: nil; end: 9.
	self deny: anchor knowsStart; assert: anchor knowsEnd; deny: anchor hasSource.
	#(0 -1 10 1.5) do: [ :offset |
		anchor start: offset; end: offset.
		self deny: anchor knowsStart; deny: anchor knowsEnd; deny: anchor hasSource ].
	anchor start: 8; end: 2.
	self assert: anchor knowsStart; deny: anchor knowsEnd; deny: anchor hasSource.
	self assert: anchor sourceText equals: ''
]

{ #category : #tests }
FmxSQLSourceAnchorProtocolTest >> testProtocolSurvivesRoundTrip [
	| model owner query anchor restored |
	model := FmxSQLModel new.
	owner := FmxSQLStoredProcedure new name: 'example'; source: 'SELECT 42'; mooseModel: model; yourself.
	query := FmxSQLSelectQuery new container: owner; mooseModel: model; yourself.
	anchor := FmxSQLEntitySourceAnchor new entity: owner; start: 8; end: 9; mooseModel: model; yourself.
	query sourceAnchor: anchor.
	restored := FmxSQLModel importFromMSEStream:
		(String streamContents: [ :stream | model exportToMSEStream: stream ]) readStream.
	anchor := (restored allWithType: FmxSQLEntitySourceAnchor) anyOne.
	self assert: anchor knowsStart; assert: anchor knowsEnd; assert: anchor hasSource.
	self assert: anchor sourceText equals: '42'
]
