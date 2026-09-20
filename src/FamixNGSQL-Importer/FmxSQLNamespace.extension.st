Extension { #name : #FmxSQLNamespace }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamespace >> createReferenceEntityFrom: aFmxSQLEntity [ 
	^ FmxSQLNamespaceReference new
		namespace: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamespace >> reachableEntities [
	^ self namespaceEntities
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamespace >> mooseName [
	^ FmxSQLMooseName nameFor: self
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamespace >> mooseNameOn: aStream [
	aStream nextPutAll: (FmxSQLMooseName nameFor: self)
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamespace >> hasUniqueMooseNameInModel [
	^ FmxSQLMooseName isUniqueFor: self
]
