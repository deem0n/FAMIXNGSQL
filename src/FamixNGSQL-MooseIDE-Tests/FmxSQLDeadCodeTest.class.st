Class {
 #name : #FmxSQLDeadCodeTest,
 #superclass : #TestCase,
 #category : #'FamixNGSQL-MooseIDE-Tests'
}
{ #category : #tests }
FmxSQLDeadCodeTest >> testDefaultProtectsExternalAndUncertainRoutines [
 | routine rule |
 routine := FmxSQLStoredProcedure new.
 rule := FmxSQLDeadCodeRule new.
 self deny: rule selectedByDefault.
 self assert: (rule notDead: routine).
 rule closedWorldCandidates: { routine }.
 self assert: (rule notDead: routine).
 routine cacheAt: #analysisStatus put: #visited.
 self deny: (rule notDead: routine).
 rule externalEntryPoints: { routine }.
 self assert: (rule notDead: routine).
 self deny: (rule notDead: FamixStMethod new)
]
{ #category : #tests }
FmxSQLDeadCodeTest >> testTriggerBindingProtectsClosedWorldCandidate [
 | routine rule |
 routine := FmxSQLTriggerStoredProcedure new.
 routine cacheAt: #analysisStatus put: #visited.
 FmxSQLTrigger new storedProcedure: routine.
 rule := FmxSQLDeadCodeRule new closedWorldCandidates: { routine }; yourself.
 self assert: (rule notDead: routine)
]
{ #category : #tests }
FmxSQLDeadCodeTest >> testConstraintBindingProtectsClosedWorldCandidate [
 | routine rule |
 routine := FmxSQLStoredProcedure new.
 routine cacheAt: #analysisStatus put: #visited.
 FmxSQLCheckConstraint new addStoredProceduresCalled: routine.
 rule := FmxSQLDeadCodeRule new closedWorldCandidates: { routine }; yourself.
 self assert: (rule notDead: routine)
]
{ #category : #tests }
FmxSQLDeadCodeTest >> testStandardBrowserUsesConservativeDefault [
 | model routine browser rule |
 model := FmxSQLModel new.
 routine := FmxSQLStoredProcedure new name: 'candidate'; mooseModel: model; yourself.
 routine cacheAt: #analysisStatus put: #visited.
 browser := FmxSQLDeadCodeRule openOn: { routine }.
 [
   browser specModel runComputation.
   self assertEmpty: browser specModel deadEntities.
   rule := browser specModel chosenRules detect: [ :each | each isKindOf: FmxSQLDeadCodeRule ].
   rule closedWorldCandidates: { routine }.
   browser specModel runComputation.
   self assert: (browser specModel deadEntities includes: routine) ]
   ensure: [ browser window ifNotNil: #close ]
]
