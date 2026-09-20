Extension { #name : #FmxSQLLocalVariable }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLLocalVariable >> createReferenceEntityFrom: aFmxSQLEntity [
	aFmxSQLEntity class = PSQLASTIgnoredLocalVariableNullObject
		ifTrue: [ ^ self ].
	
	^ FmxSQLLocalVariableAccess new
		localVariable: self;
		accessor: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLLocalVariable >> reachableEntities [
	^ self type ifNil: [ #() ] ifNotNil: [ :aType | aType reachableEntities ]
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLLocalVariable >> mooseNameOn: aStream [
	aStream nextPutAll: (FmxSQLMooseName nameFor: self)
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLLocalVariable >> hasUniqueMooseNameInModel [
	^ FmxSQLMooseName isUniqueFor: self
]
