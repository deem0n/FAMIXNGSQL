Class {
 #name : #FmxSQLReplicationCleanerTest,
 #superclass : #TestCase,
 #category : #'FamixNGSQL-MooseIDE-Tests'
}
{ #category : #tests }
FmxSQLReplicationCleanerTest >> testCommentsAndTokenBoundaries [
 self assert: (FmxSQLReplicationCleaner new cleanedTextLines:
   '-- heading', String lf, 'SELECT/* a /* nested */ b */x -- end') asArray
   equals: { 2 -> 'SELECT x' }
]
{ #category : #tests }
FmxSQLReplicationCleanerTest >> testQuotesAndDollarBodiesAreVerbatim [
 | text |
 text := 'SELECT ''https://x -- /*  y */'', "a""--b", $tag$ /*  -- */ $tag$, ''it''''s  ok'''.
 self assert: (FmxSQLReplicationCleaner new cleanedTextLines: text) first value equals: text.
 self deny: (FmxSQLReplicationCleaner new cleanedTextLines: 'SELECT ''a b''')
   equals: (FmxSQLReplicationCleaner new cleanedTextLines: 'SELECT ''ab''')
]
{ #category : #tests }
FmxSQLReplicationCleanerTest >> testEscapedQuoteAndMultilineLiteral [
 | text lines |
 text := 'SELECT E''a\''--  b'', $$', String lf, '  -- body  ', String lf, '$$;', String lf,
   '/* comment', String lf, '*/', String lf, 'SELECT 2'.
 lines := FmxSQLReplicationCleaner new cleanedTextLines: text.
 self assert: lines second equals: 2 -> '  -- body  '.
 self assert: lines last equals: 6 -> 'SELECT 2'.
 self assert: lines first value equals: 'SELECT E''a\''--  b'', $$'
]
{ #category : #tests }
FmxSQLReplicationCleanerTest >> testRejectsUnterminatedLexemes [
 { '/* missing'. 'SELECT ''missing'. 'SELECT $a$missing' } do: [ :text |
   self should: [ FmxSQLReplicationCleaner new cleanedTextLines: text ] raise: Error ]
]
{ #category : #tests }
FmxSQLReplicationCleanerTest >> testStandardDetectorOnSQLSourceAnchors [
 | entities configuration manager |
 entities := (1 to: 2) collect: [ :i | | owner query |
   owner := FmxSQLView new name: 'view', i asString; source: 'SELECT 1', String lf, 'FROM items'; yourself.
   query := FmxSQLSelectQuery new.
   query sourceAnchor: (FmxSQLEntitySourceAnchor new entity: owner; start: 1; end: owner source size; yourself).
   query ].
 configuration := FamixRepConfiguration sourcesCleaner: FmxSQLReplicationCleaner new
   minimumNumberOfReplicas: 2 ofLines: 2 ofCharacters: 1.
 manager := FamixRepDetector new configuration: configuration; runOn: entities.
 self assert: manager replicatedFragments notEmpty.
 self assert: manager replicatedFragments anyOne replicas anyOne codeText equals: entities first sourceText
]

{ #category : #tests }
FmxSQLReplicationCleanerTest >> testStandardBrowserUsesSQLCleaner [
 | owner query browser |
 owner := FmxSQLView new source: 'SELECT 1'; yourself.
 query := FmxSQLSelectQuery new.
 query sourceAnchor: (FmxSQLEntitySourceAnchor new entity: owner; start: 1; end: 8; yourself).
 browser := FmxSQLReplicationCleaner openOn: { query }.
 [ self assert: browser specModel currentConfiguration sourcesCleaner class equals: FmxSQLReplicationCleaner.
   self assert: (MiDuplicationBrowserModel availableSourcesCleaners anySatisfy: [ :cleaner |
     cleaner class = FmxSQLReplicationCleaner ]) ] ensure: [ browser window close ]
]
