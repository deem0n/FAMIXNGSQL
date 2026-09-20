"Co-usage of database relations: containers are routines, views or tables;
inner boxes are referenced tables/views. Repeated references retain their frequency."
Class {
 #name : #FmxSQLCoUsageExtractor,
 #superclass : #MiCoInnerEntitiesAbstractExtractor,
 #category : #'FamixNGSQL-MooseIDE'
}
{ #category : #accessing }
FmxSQLCoUsageExtractor class >> menuItemName [ ^ 'SQL relation references' ]
{ #category : #accessing }
FmxSQLCoUsageExtractor class >> description [
 ^ 'Referenced tables and views, including column and foreign-key references. Repeated references count as repeated uses.'
]
{ #category : #testing }
FmxSQLCoUsageExtractor class >> accepts: entity [
 ^ { FmxSQLTable. FmxSQLForeignTable. FmxSQLView. FmxSQLStoredProcedure }
   anySatisfy: [ :class | entity isKindOf: class ]
]
{ #category : #opening }
FmxSQLCoUsageExtractor class >> openOn: entities [
 | browser |
 (entities allSatisfy: [ :entity | self accepts: entity ]) ifFalse: [
   self error: 'SQL CoUsage expects only tables, views or routines' ].
 browser := MiCoUsageMapBrowser new.
 browser specModel settings innerBoxExtractor: self.
 browser open.
 browser followEntity: entities asMooseGroup.
 ^ browser
]
{ #category : #querying }
FmxSQLCoUsageExtractor >> innerEntitiesFor: entity [
 | relations |
 (self class accepts: entity) ifFalse: [ self error: 'Unsupported SQL CoUsage entity' ].
 relations := OrderedCollection new.
 entity queryAllOutgoing do: [ :reference |
   ((reference isKindOf: FmxSQLColumnReference) or: [
     (reference isKindOf: FmxSQLTableReference) or: [ reference isKindOf: FmxSQLViewReference ] ]) ifTrue: [
     reference allTargets asSet do: [ :target |
       | relation |
       relation := (target isKindOf: FmxSQLColumn)
         ifTrue: [ target columnsContainer ] ifFalse: [ target ].
       ((relation isKindOf: FmxSQLTable) or: [
         (relation isKindOf: FmxSQLForeignTable) or: [ relation isKindOf: FmxSQLView ] ])
           ifTrue: [ relations add: relation ] ] ] ].
 ^ relations
]
