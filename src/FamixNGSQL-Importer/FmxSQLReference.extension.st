Extension { #name : #FmxSQLReference }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReference >> reference [
	^ self subclassResponsibility
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReference >> resolveAsPartOfTheQuery: aFmxSQLInsertQuery [ 
	self shouldBeImplemented.
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReference >> from [
	^ self source
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReference >> to [
	^ self target
]
