"SQL routines are externally callable. The default protects them all.
Opt into a closed-world candidate set only when its external callers are known.
Trigger/constraint entry points and incomplete analysis remain protected."
Class {
 #name : #FmxSQLDeadCodeRule,
 #superclass : #MiDeadAbstractRule,
 #instVars : [ 'closedWorldCandidates', 'externalEntryPoints' ],
 #category : #'FamixNGSQL-MooseIDE'
}
{ #category : #initialization }
FmxSQLDeadCodeRule >> initialize [
 super initialize.
 closedWorldCandidates := IdentitySet new.
 externalEntryPoints := IdentitySet new
]
{ #category : #accessing }
FmxSQLDeadCodeRule >> closedWorldCandidates: entities [ closedWorldCandidates := entities asIdentitySet ]
{ #category : #accessing }
FmxSQLDeadCodeRule >> externalEntryPoints: entities [ externalEntryPoints := entities asIdentitySet ]
{ #category : #accessing }
FmxSQLDeadCodeRule >> name [ ^ super name, 'PostgreSQL entry points and incomplete evidence' ]
{ #category : #testing }
FmxSQLDeadCodeRule >> selectedByDefault [ ^ false ]
{ #category : #testing }
FmxSQLDeadCodeRule >> notDead: entity [
 (entity isKindOf: FmxSQLStoredProcedure) ifFalse: [ ^ false ].
 (closedWorldCandidates includes: entity) ifFalse: [ ^ true ].
 (externalEntryPoints includes: entity) ifTrue: [ ^ true ].
 ((entity respondsTo: #triggers) and: [ entity triggers isNotEmpty ]) ifTrue: [ ^ true ].
 (entity checkConstraintsCalling isNotEmpty or: [ entity exclusionConstraintsCalling isNotEmpty ]) ifTrue: [ ^ true ].
 ^ (entity cacheAt: #analysisStatus ifAbsent: [ nil ]) ~= #visited
]

{ #category : #opening }
FmxSQLDeadCodeRule class >> openOn: entities [
 | browser |
 (entities isEmpty or: [ (entities allSatisfy: [ :entity | entity isKindOf: FmxSQLStoredProcedure ]) not ])
   ifTrue: [ self error: 'SQL dead-code analysis expects a nonempty routine collection' ].
 browser := MiDeadBrowser new.
 browser open.
 browser specModel chooseRules: { self new }.
 browser followEntity: entities asMooseGroup.
 ^ browser
]
