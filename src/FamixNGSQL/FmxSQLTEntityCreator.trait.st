"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FmxSQLTEntityCreator',
	#category : 'FamixNGSQL-Model',
	#package : 'FamixNGSQL',
	#tag : 'Model'
}

{ #category : 'meta' }
FmxSQLTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newAlias [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLAlias new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newAliasAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLAliasAccess new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newAliasNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLAlias named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newAssociation [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLAssociation new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCRUDQuery [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLCRUDQuery new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCheckConstraint [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLCheckConstraint new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCheckConstraintNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLCheckConstraint named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumn [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLColumn new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnAlias [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLColumnAlias new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnAliasAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLColumnAliasAccess new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnAliasNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLColumnAlias named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLColumn named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLColumnReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnsContainerAlias [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLColumnsContainerAlias new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnsContainerAliasAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLColumnsContainerAliasAccess new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newColumnsContainerAliasNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLColumnsContainerAlias named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLComment new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newConstraint [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLConstraint new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newConstraintNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLConstraint named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCursor [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLCursor new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCursorNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLCursor named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCursorParameter [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLCursorParameter new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCursorParameterAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLCursorParameterAccess new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCursorParameterNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLCursorParameter named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newCursorReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLCursorReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newDeleteQuery [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLDeleteQuery new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newDerivedTable [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLDerivedTable new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newDerivedTableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLDerivedTable named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newDerivedTableReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLDerivedTableReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newEntitySourceAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLEntitySourceAnchor new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newExceptClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLExceptClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newExclusionConstraint [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLExclusionConstraint new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newExclusionConstraintNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLExclusionConstraint named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newForeignKeyConstraint [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLForeignKeyConstraint new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newForeignKeyConstraintNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLForeignKeyConstraint named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newForeignTable [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLForeignTable new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newForeignTableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLForeignTable named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newFromClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLFromClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newGroupByClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLGroupByClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newHavingClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLHavingClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newInsertQuery [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLInsertQuery new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newIntersectClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLIntersectClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newIntoClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLIntoClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newJoinClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLJoinClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newLimitClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLLimitClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLLocalVariable new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newLocalVariableAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLLocalVariableAccess new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newLocalVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLLocalVariable named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newNamespace [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLNamespace new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newNamespaceNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLNamespace named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newNamespaceReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLNamespaceReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newNewLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLNewLocalVariable new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newNewLocalVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLNewLocalVariable named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newNotNullConstraint [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLNotNullConstraint new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newNotNullConstraintNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLNotNullConstraint named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newOldLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLOldLocalVariable new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newOldLocalVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLOldLocalVariable named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newOnConflictClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLOnConflictClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newOrderByClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLOrderByClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newParameter [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLParameter new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newParameterAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLParameterAccess new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newParameterNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLParameter named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newPrimaryKeyConstraint [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLPrimaryKeyConstraint new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newPrimaryKeyConstraintNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLPrimaryKeyConstraint named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newQualifiedReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLQualifiedReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newRecordLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLRecordLocalVariable new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newRecordLocalVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLRecordLocalVariable named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newReferencesGroup [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLReferencesGroup new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newReferencesGroupReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLReferencesGroupReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newReturningClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLReturningClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newSelectClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLSelectClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newSelectQuery [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLSelectQuery new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newSetClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLSetClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLSourceLanguage new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLSourceTextAnchor new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newStoredProcedure [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLStoredProcedure new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newStoredProcedureCall [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLStoredProcedureCall new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newStoredProcedureNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLStoredProcedure named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newStructuralEntity [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLStructuralEntity new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newStructuralEntityNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLStructuralEntity named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTable [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLTable new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLTable named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTableReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLTableReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTrigger [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLTrigger new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTriggerNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLTrigger named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTriggerStoredProcedure [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLTriggerStoredProcedure new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTriggerStoredProcedureNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLTriggerStoredProcedure named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newType [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLType new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLType named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newTypeReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLTypeReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newUnionClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLUnionClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newUniqueConstraint [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLUniqueConstraint new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newUniqueConstraintNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLUniqueConstraint named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newUpdateQuery [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLUpdateQuery new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newUsingClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLUsingClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newValuesClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLValuesClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newValuesQuery [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLValuesQuery new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newView [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLView new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newViewNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FmxSQLView named: aName)
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newViewReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLViewReference new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newWhereClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLWhereClause new
]

{ #category : 'entity creation' }
FmxSQLTEntityCreator >> newWithClause [

	<ignoreForCoverage>
	<generated>
	^ self add: FmxSQLWithClause new
]
