Class {
 #name : #FmxSQLRoassalViewsTest,
 #superclass : #TestCase,
 #category : #'FamixNGSQL-MooseIDE-Tests'
}
{ #category : #tests }
FmxSQLRoassalViewsTest >> testEmptyModel [
 | model |
 model := FmxSQLModel new.
 #(schemaTablesIn: foreignKeysIn: routineCallsIn:) do: [ :selector |
   | canvas |
   canvas := FmxSQLRoassalViews perform: selector with: model.
   self assert: canvas nodes isEmpty.
   self assert: canvas edges isEmpty ]
]
{ #category : #tests }
FmxSQLRoassalViewsTest >> testCompositeForeignKeysAndDisconnectedTable [
 | model source target lonely foreignKey canvas before |
 model := FmxSQLModel new.
 source := FmxSQLTable new name: 'orders'; mooseModel: model; yourself.
 target := FmxSQLTable new name: 'customers'; mooseModel: model; yourself.
 lonely := FmxSQLTable new name: 'disconnected'; mooseModel: model; yourself.
 foreignKey := FmxSQLForeignKeyConstraint new table: source; mooseModel: model; yourself.
 2 timesRepeat: [ | column |
   column := FmxSQLColumn new columnsContainer: target; mooseModel: model; yourself.
   FmxSQLColumnReference new foreignKeyConstraintSource: foreignKey; target: column; mooseModel: model ].
 before := model entities size.
 self assert: (FmxSQLRoassalViews foreignKeyPairsIn: model) asArray equals: { { source. target } }.
 canvas := FmxSQLRoassalViews foreignKeysIn: model.
 self assert: canvas nodes size equals: 3.
 self assert: canvas edges size equals: 1.
 self assert: canvas edges first from model identicalTo: source.
 self assert: canvas edges first to model identicalTo: target.
 self assert: model entities size equals: before
]
{ #category : #tests }
FmxSQLRoassalViewsTest >> testCallCandidatesIncludingTriggerAndExternalTarget [
 | model caller target trigger external canvas |
 model := FmxSQLModel new.
 caller := FmxSQLStoredProcedure new name: 'caller'; mooseModel: model; yourself.
 target := FmxSQLStoredProcedure new name: 'callee'; mooseModel: model; yourself.
 trigger := FmxSQLTriggerStoredProcedure new name: 'trigger'; mooseModel: model; yourself.
 external := FmxSQLStoredProcedure new name: 'outside'; yourself.
 FmxSQLStoredProcedureCall new sender: caller; candidates: { target. trigger. external }; mooseModel: model.
 self assert: (FmxSQLRoassalViews routineCallPairsIn: model) size equals: 2.
 canvas := FmxSQLRoassalViews routineCallsIn: model.
 self assert: canvas nodes size equals: 3.
 self assert: canvas edges size equals: 2
]
{ #category : #tests }
FmxSQLRoassalViewsTest >> testSchemaContainsTableShapes [
 | model schema table canvas |
 model := FmxSQLModel new.
 schema := FmxSQLNamespace new name: 'app'; mooseModel: model; yourself.
 table := FmxSQLTable new name: 'items'; parentNamespace: schema; mooseModel: model; yourself.
 canvas := FmxSQLRoassalViews schemaTablesIn: model.
 self assert: canvas nodes size equals: 1.
 self assert: canvas nodes first model identicalTo: schema.
 self assert: (canvas nodes first allChildren anySatisfy: [ :shape | shape model == table ])
]
