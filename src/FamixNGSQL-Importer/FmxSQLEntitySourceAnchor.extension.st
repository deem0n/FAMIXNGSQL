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
