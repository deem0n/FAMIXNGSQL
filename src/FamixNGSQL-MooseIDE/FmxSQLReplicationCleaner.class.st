"PostgreSQL lexical cleaner. Preserves quoted text and line positions; assumes standard_conforming_strings = on."
Class {
 #name : #FmxSQLReplicationCleaner,
 #superclass : #FamixRepSourcesCleaner,
 #instVars : [ 'source', 'index', 'output', 'state', 'depth', 'delimiter', 'escaped', 'pendingSpace', 'lineHasCode' ],
 #category : #'FamixNGSQL-MooseIDE'
}

{ #category : #accessing }
FmxSQLReplicationCleaner class >> description [
 ^ 'PostgreSQL comments and quoting (standard_conforming_strings=on)'
]

{ #category : #printing }
FmxSQLReplicationCleaner class >> displayStringOn: stream [
 stream nextPutAll: 'PostgreSQL'
]

{ #category : #opening }
FmxSQLReplicationCleaner class >> openOn: entities [
 | browser configuration |
 (entities notEmpty and: [ entities allSatisfy: [ :entity |
   (entity isKindOf: FmxSQLEntity) and: [ entity hasSourceAnchor ] ] ])
   ifFalse: [ self error: 'Select SQL entities with source anchors' ].
 browser := MiDuplicationBrowser new.
 browser followEntity: entities asMooseGroup.
 configuration := browser specModel currentConfiguration.
 configuration sourcesCleaner: self new.
 browser specModel updateFromConfiguration: configuration.
 browser open.
 ^ browser
]

{ #category : #cleaning }
FmxSQLReplicationCleaner >> cleanedTextLines: text [
 | lines |
 source := text.
 index := 1.
 output := String new writeStream.
 state := #normal.
 depth := 0.
 pendingSpace := false.
 lineHasCode := false.
 [ index <= source size ] whileTrue: [ self scanNext ].
 (#(normal lineComment) includes: state) ifFalse: [ self error: 'Unterminated SQL quoted text or comment' ].
 lines := OrderedCollection new.
 output contents lines doWithIndex: [ :line :lineNumber |
   line ifNotEmpty: [ lines add: lineNumber -> line ] ].
 ^ lines
]

{ #category : #private }
FmxSQLReplicationCleaner >> matches: text [
 ^ index + text size - 1 <= source size and: [
   (source copyFrom: index to: index + text size - 1) = text ]
]

{ #category : #private }
FmxSQLReplicationCleaner >> putCode: character [
 (pendingSpace and: [ lineHasCode ]) ifTrue: [ output space ].
 pendingSpace := false.
 output nextPut: character.
 lineHasCode := true
]

{ #category : #private }
FmxSQLReplicationCleaner >> dollarDelimiter [
 | end tag |
 end := source indexOf: $$ startingAt: index + 1 ifAbsent: [ 0 ].
 end = 0 ifTrue: [ ^ nil ].
 tag := source copyFrom: index + 1 to: end - 1.
 (tag notEmpty and: [ (tag first isLetter or: [ tag first = $_ ]) not
   or: [ (tag allSatisfy: [ :c | c isAlphaNumeric or: [ c = $_ ] ]) not ] ]) ifTrue: [ ^ nil ].
 (index > 1 and: [ (source at: index - 1) isAlphaNumeric or: [ (source at: index - 1) = $_ ] ]) ifTrue: [ ^ nil ].
 ^ source copyFrom: index to: end
]

{ #category : #private }
FmxSQLReplicationCleaner >> scanNext [
 | c quote |
 c := source at: index.
 state = #dollar ifTrue: [
   (self matches: delimiter)
     ifTrue: [ output nextPutAll: delimiter. index := index + delimiter size. state := #normal ]
     ifFalse: [ output nextPut: c. index := index + 1 ].
   ^ self ].
 state = #quoted ifTrue: [
   output nextPut: c.
   index := index + 1.
   (escaped and: [ c = $\ and: [ index <= source size ] ]) ifTrue: [
     output nextPut: (source at: index). index := index + 1. ^ self ].
   c = delimiter ifTrue: [
     (index <= source size and: [ (source at: index) = delimiter ])
       ifTrue: [ output nextPut: delimiter. index := index + 1 ]
       ifFalse: [ state := #normal ] ].
   ^ self ].
 (c = Character cr or: [ c = Character lf ]) ifTrue: [
   output nextPut: c. pendingSpace := false. lineHasCode := false.
   state = #lineComment ifTrue: [ state := #normal ].
   index := index + 1. ^ self ].
 state = #lineComment ifTrue: [ index := index + 1. ^ self ].
 state = #blockComment ifTrue: [
   (self matches: '/*') ifTrue: [ depth := depth + 1. index := index + 2. ^ self ].
   (self matches: '*/') ifTrue: [ depth := depth - 1. index := index + 2.
     depth = 0 ifTrue: [ state := #normal ]. ^ self ].
   index := index + 1. ^ self ].
 c isSeparator ifTrue: [ pendingSpace := true. index := index + 1. ^ self ].
 (self matches: '--') ifTrue: [ state := #lineComment. index := index + 2. ^ self ].
 (self matches: '/*') ifTrue: [ state := #blockComment. depth := 1.
   pendingSpace := true. index := index + 2. ^ self ].
 quote := c = $' or: [ c = $" ].
 quote ifTrue: [
   escaped := c = $' and: [ index > 1 and: [
     (source at: index - 1) asLowercase = $e and: [ index = 2 or: [
       ((source at: index - 2) isAlphaNumeric or: [ '_$' includes: (source at: index - 2) ]) not ] ] ] ].
   delimiter := c. state := #quoted ].
 (c = $$ and: [ (delimiter := self dollarDelimiter) notNil ]) ifTrue: [
   self putCode: c.
   output nextPutAll: delimiter allButFirst.
   index := index + delimiter size. state := #dollar. ^ self ].
 self putCode: c.
 index := index + 1
]
