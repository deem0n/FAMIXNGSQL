Extension { #name : #FmxSQLCursorParameter }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCursorParameter >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLCursorParameterAccess new
		variable: self;
		accessor: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself.
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCursorParameter >> mooseNameOn: aStream [
	aStream nextPutAll: (FmxSQLMooseName nameFor: self)
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLCursorParameter >> hasUniqueMooseNameInModel [
	^ FmxSQLMooseName isUniqueFor: self
]
