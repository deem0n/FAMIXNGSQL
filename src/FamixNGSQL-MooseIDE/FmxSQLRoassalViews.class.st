"Roassal 3 views using SQL containment and association APIs. Builders return unopened canvases."
Class {
 #name : #FmxSQLRoassalViews,
 #superclass : #Object,
 #category : #'FamixNGSQL-MooseIDE'
}
{ #category : #building }
FmxSQLRoassalViews class >> schemaTablesIn: model [
 | graph |
 graph := RSMondrian new.
 graph shape box color: Color veryLightGray; labeled: #name.
 graph nodes: (model allWithType: FmxSQLNamespace) forEach: [ :schema |
   | tables |
   tables := schema namespaceEntities select: [ :e | e isKindOf: FmxSQLTable ].
   graph shape box color: Color blue lighter; labeled: #name.
   graph nodes: tables.
   graph layout grid ].
 graph layout grid.
 graph build.
 ^ graph canvas
]
{ #category : #building }
FmxSQLRoassalViews class >> foreignKeysIn: model [
 ^ self graphOf: (model allWithType: FmxSQLTable) pairs: (self foreignKeyPairsIn: model)
]
{ #category : #building }
FmxSQLRoassalViews class >> routineCallsIn: model [
 ^ self graphOf: (self routinesIn: model) pairs: (self routineCallPairsIn: model)
]
{ #category : #private }
FmxSQLRoassalViews class >> graphOf: entities pairs: pairs [
 | graph |
 graph := RSMondrian new.
 graph shape box color: Color green muchLighter; labeled: [ :entity | self labelFor: entity ].
 graph nodes: entities.
 graph arrowedLine color: Color gray; connectToAll: [ :entity |
   (pairs select: [ :pair | pair first == entity ]) collect: #second ].
 graph layout circle.
 graph build.
 graph canvas edges do: #pushFront.
 ^ graph canvas
]
{ #category : #private }
FmxSQLRoassalViews class >> labelFor: entity [
 ^ (entity parentNamespace ifNil: [ '' ] ifNotNil: [ :ns | ns name, '.' ]), entity name
]
{ #category : #extracting }
FmxSQLRoassalViews class >> foreignKeyPairsIn: model [
 | tables pairs |
 tables := IdentitySet withAll: (model allWithType: FmxSQLTable).
 pairs := Set new.
 (model allWithType: FmxSQLForeignKeyConstraint) do: [ :foreignKey |
   foreignKey outgoingForeignKeyColumnReferences do: [ :reference |
     | target |
     target := reference target ifNotNil: [ :column | column columnsContainer ].
     ((tables includes: foreignKey table) and: [ tables includes: target ]) ifTrue: [
       pairs add: { foreignKey table. target } ] ] ].
 ^ pairs
]
{ #category : #extracting }
FmxSQLRoassalViews class >> routinesIn: model [
 ^ ((model allWithType: FmxSQLStoredProcedure) asOrderedCollection
   addAll: (model allWithType: FmxSQLTriggerStoredProcedure); yourself) asIdentitySet
]
{ #category : #extracting }
FmxSQLRoassalViews class >> routineCallPairsIn: model [
 | routines pairs |
 routines := self routinesIn: model.
 pairs := Set new.
 (model allWithType: FmxSQLStoredProcedureCall) do: [ :call |
   | caller |
   caller := call source.
   (caller notNil and: [ (routines includes: caller) not ]) ifTrue: [
     caller := caller allParents detect: [ :parent | routines includes: parent ] ifNone: [ nil ] ].
   (routines includes: caller) ifTrue: [
     call allTargets do: [ :target | (routines includes: target) ifTrue: [ pairs add: { caller. target } ] ] ] ].
 ^ pairs
]
