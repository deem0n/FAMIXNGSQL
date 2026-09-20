Class {
 #name : #FmxSQLCoUsageTest,
 #superclass : #TestCase,
 #category : #'FamixNGSQL-MooseIDE-Tests'
}
{ #category : #tests }
FmxSQLCoUsageTest >> testSharedRelationsAndRepeatedReferences [
 | model table column first second extractor browser |
 model := FmxSQLModel new.
 table := FmxSQLTable new name: 'records'; mooseModel: model; yourself.
 column := FmxSQLColumn new name: 'id'; columnsContainer: table; mooseModel: model; yourself.
 first := FmxSQLStoredProcedure new name: 'first'; mooseModel: model; yourself.
 second := FmxSQLStoredProcedure new name: 'second'; mooseModel: model; yourself.
 FmxSQLColumnReference new source: first; column: column; mooseModel: model.
 FmxSQLTableReference new source: first; table: table; mooseModel: model.
 FmxSQLTableReference new source: second; table: table; mooseModel: model.
 extractor := FmxSQLCoUsageExtractor new.
 self assert: (extractor innerEntitiesFor: first) asArray equals: { table. table }.
 self assert: (extractor innerEntitiesFor: second) asArray equals: { table }.
 browser := FmxSQLCoUsageExtractor openOn: { first. second }.
 [ self assert: browser specModel containerBoxes size equals: 2.
   self assert: browser specModel innerBoxes size equals: 1 ]
   ensure: [ browser window close ]
]
{ #category : #tests }
FmxSQLCoUsageTest >> testForeignKeyAndEmptyTable [
 | model source target column constraint |
 model := FmxSQLModel new.
 source := FmxSQLTable new name: 'source'; mooseModel: model; yourself.
 target := FmxSQLTable new name: 'target'; mooseModel: model; yourself.
 column := FmxSQLColumn new name: 'id'; columnsContainer: target; mooseModel: model; yourself.
 constraint := FmxSQLForeignKeyConstraint new name: 'fk'; table: source; mooseModel: model; yourself.
 FmxSQLColumnReference new foreignKeyConstraintSource: constraint; column: column; mooseModel: model.
 self assert: (FmxSQLCoUsageExtractor new innerEntitiesFor: source) asArray equals: { target }.
 self assertEmpty: (FmxSQLCoUsageExtractor new innerEntitiesFor: target)
]
{ #category : #tests }
FmxSQLCoUsageTest >> testUnsupportedInputIsRejectedBeforeOpening [
 self should: [ FmxSQLCoUsageExtractor openOn: { Object new } ] raise: Error.
 self should: [ FmxSQLCoUsageExtractor new innerEntitiesFor: Object new ] raise: Error
]
