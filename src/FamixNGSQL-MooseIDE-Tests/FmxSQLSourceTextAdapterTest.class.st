Class {
	#name : #FmxSQLSourceTextAdapterTest,
	#superclass : #TestCase,
	#category : #'FamixNGSQL-MooseIDE-Tests'
}
{ #category : #tests }
FmxSQLSourceTextAdapterTest >> testAdapterSelectionAndPlainSourceFallback [
	| routine adapter |
	routine := FmxSQLStoredProcedure new source: 'SELECT 1'; yourself.
	adapter := MiAbstractSourceTextAnchorAdapter adapterFor: routine.
	self assert: adapter class equals: FmxSQLSourceTextAdapter.
	adapter initializeDisplayedText: routine sourceText andEntity: routine.
	self assert: (adapter intervalForEntity: routine) isNil.
	self assert: routine sourceText equals: 'SELECT 1'
]
{ #category : #tests }
FmxSQLSourceTextAdapterTest >> testFragmentOffsetsAndForeignOwner [
	| owner query reference adapter |
	owner := FmxSQLStoredProcedure new source: 'prefix SELECT x suffix'; yourself.
	query := FmxSQLSelectQuery new sourceAnchor:
		(FmxSQLEntitySourceAnchor new entity: owner; start: 8; end: 15; yourself); yourself.
	reference := FmxSQLColumnReference new sourceAnchor:
		(FmxSQLEntitySourceAnchor new entity: owner; start: 15; end: 15; yourself); yourself.
	adapter := FmxSQLSourceTextAdapter new initializeDisplayedText: query sourceText andEntity: query; yourself.
	self assert: (adapter intervalForEntity: reference) equals: (8 to: 8).
	reference sourceAnchor start: 1; end: 6.
	self assert: (adapter intervalForEntity: reference) isNil.
	reference sourceAnchor entity: (FmxSQLStoredProcedure new source: owner source; yourself); start: 15; end: 15.
	self assert: (adapter intervalForEntity: reference) isNil
]
{ #category : #tests }
FmxSQLSourceTextAdapterTest >> testInvalidAnchorHasNoHighlight [
	| routine reference adapter |
	routine := FmxSQLStoredProcedure new source: 'SELECT 1'; yourself.
	reference := FmxSQLColumnReference new sourceAnchor:
		(FmxSQLEntitySourceAnchor new entity: routine; start: 0; end: 99; yourself); yourself.
	adapter := FmxSQLSourceTextAdapter new initializeDisplayedText: routine sourceText andEntity: routine; yourself.
	self assert: (adapter intervalForEntity: reference) isNil
]
{ #category : #tests }
FmxSQLSourceTextAdapterTest >> testStandardBrowserOnRoutineAndView [
	| model view routine browser |
	model := FmxSQLModel new.
	view := FmxSQLView new name: 'example'; source: 'SELECT 1'; mooseModel: model; yourself.
	FmxSQLSelectQuery new viewDefining: view; mooseModel: model.
	routine := FmxSQLStoredProcedure new name: 'example'; source: 'SELECT 1'; mooseModel: model; yourself.
	browser := MiSourceTextBrowser new.
	[ browser open.
		{ routine. view } do: [ :entity |
			browser followEntity: entity.
			self assert: browser specModel selectedEntity identicalTo: entity.
			self assert: browser specModel rendererModel displayedText asString equals: entity sourceText ] ]
		ensure: [ browser window ifNotNil: #close ]
]
