Class {
	#name : 'FmxSQLEntity',
	#superclass : 'MooseEntity',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #FamixNGSQL>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FmxSQLEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FmxSQLEntity
]

{ #category : 'meta' }
FmxSQLEntity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FmxSQLModel metamodel
]

{ #category : 'testing' }
FmxSQLEntity >> canBeStub [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> hasImmediateSource [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isAccess [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isAlias [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isAliasAccess [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isAssociation [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isCheckConstraint [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isColumn [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isColumnReference [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isComment [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isConstraint [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isCursor [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isEntitySourceAnchor [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isExceptClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isExclusionConstraint [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isForeignKeyConstraint [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isFromClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isGroupByClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isHavingClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isIntersectClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isInvocation [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isJoinClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isLimitClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isLocalVariableAccess [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isNamespace [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isNotNullConstraint [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isOnConflictClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isOrderByClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isParameterAccess [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isPrimaryKeyConstraint [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isQueryContainer [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isQueryable [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isReturningClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isSelectClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isSetClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isStoredProcedure [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isStoredProcedureCall [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isStructuralEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isTriggerStoredProcedure [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isUnionClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isUniqueConstraint [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isUsingClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isValuesClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isView [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isWhereClause [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FmxSQLEntity >> isWithClause [

	<ignoreForCoverage>
	<generated>
	^ false
]
