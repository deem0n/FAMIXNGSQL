Extension { #name : #FmxSQLNamedEntity }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamedEntity >> mooseName [
	^ FmxSQLMooseName nameFor: self
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamedEntity >> mooseNameOn: aStream [
	aStream nextPutAll: (FmxSQLMooseName nameFor: self)
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamedEntity >> hasUniqueMooseNameInModel [
	^ FmxSQLMooseName isUniqueFor: self
]
