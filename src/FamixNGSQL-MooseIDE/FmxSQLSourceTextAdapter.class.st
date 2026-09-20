"Adapts PostgreSQL definitions and owner-relative AST intervals without file anchors."
Class {
	#name : #FmxSQLSourceTextAdapter,
	#superclass : #MiAbstractSourceTextAnchorAdapter,
	#instVars : [ 'sourceOwner', 'offset' ],
	#category : #'FamixNGSQL-MooseIDE'
}
{ #category : #testing }
FmxSQLSourceTextAdapter class >> acceptEntity: entity [
	^ (entity isKindOf: FmxSQLEntity) and: [ entity respondsTo: #sourceText ]
]
{ #category : #initialization }
FmxSQLSourceTextAdapter >> initializeDisplayedText: text andEntity: entity [
	| anchor |
	super initializeDisplayedText: text andEntity: entity.
	sourceOwner := entity.
	offset := 0.
	anchor := entity sourceAnchor.
	((anchor isKindOf: FmxSQLEntitySourceAnchor) and: [ anchor hasSourceText ]) ifTrue: [
		sourceOwner := anchor entity.
		offset := anchor start - 1 ]
]
{ #category : #accessing }
FmxSQLSourceTextAdapter >> intervalForEntity: entity [
	| anchor start end |
	(entity respondsTo: #sourceAnchor) ifFalse: [ ^ nil ].
	anchor := entity sourceAnchor.
	((anchor isKindOf: FmxSQLEntitySourceAnchor) and: [ anchor hasSourceText ]) ifFalse: [ ^ nil ].
	anchor entity == sourceOwner ifFalse: [ ^ nil ].
	start := anchor start - offset.
	end := anchor end - offset.
	(start > 0 and: [ end >= start and: [ end <= displayedText size ] ]) ifFalse: [ ^ nil ].
	^ start to: end
]
