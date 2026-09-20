Extension { #name : #FmxSQLEntitySourceAnchor }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLEntitySourceAnchor >> hasSourceText [
	^ self entity notNil and: [ self entity source notNil and: [
		self start isInteger and: [ self end isInteger and: [
			self start > 0 and: [ self end >= self start and: [ self end <= self entity source size ] ] ] ] ] ]
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLEntitySourceAnchor >> sourceText [
	"An incomplete AST may have no valid interval; the owner still retains its full source."
	^ self hasSourceText
		ifTrue: [ self entity source copyFrom: self start to: self end ]
		ifFalse: [ '' ]
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLEntitySourceAnchor >> hasSource [
	^ self hasSourceText
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLEntitySourceAnchor >> knowsStart [
	^ self entity notNil and: [ self entity source notNil and: [
		self start isInteger and: [ self start > 0 and: [ self start <= self entity source size ] ] ] ]
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLEntitySourceAnchor >> knowsEnd [
	^ self entity notNil and: [ self entity source notNil and: [
		self end isInteger and: [ self end > 0 and: [ self end <= self entity source size and: [
			self start isNil or: [ self start isInteger and: [ self end >= self start ] ] ] ] ] ] ]
]
