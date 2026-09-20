Extension { #name : #FmxSQLParameter }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLParameter >> reachableEntities [
	^ self type ifNil: [ #() ] ifNotNil: [ :aType | aType reachableEntities ]
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLParameter >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLParameterAccess new
		variable: self;
		accessor: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLParameter >> mooseNameOn: aStream [
	aStream nextPutAll: (FmxSQLMooseName nameFor: self)
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLParameter >> hasUniqueMooseNameInModel [
	^ FmxSQLMooseName isUniqueFor: self
]
