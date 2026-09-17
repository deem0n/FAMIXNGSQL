Class {
	#name : #FmxEntityParsingError,
	#superclass : #Error,
	#instVars : [
		'entity',
		'parseError'
	],
	#category : 'FamixNGSQL-Importer-Errors'
}

{ #category : #accessing }
FmxEntityParsingError >> messageText [
	^ parseError ifNil: [ super messageText ] ifNotNil: [ parseError messageText ]
]

{ #category : #accessing }
FmxEntityParsingError >> entity [
	^ entity
]

{ #category : #accessing }
FmxEntityParsingError >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
FmxEntityParsingError >> parseError [
	^ parseError
]

{ #category : #accessing }
FmxEntityParsingError >> parseError: anObject [
	parseError := anObject
]
