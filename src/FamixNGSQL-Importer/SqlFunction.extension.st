Extension { #name : #SqlFunction }

{ #category : #'*FamixNGSQL-Importer' }
SqlFunction >> ast [
	self language name = 'sql' ifTrue: [
		^ PostgreSQLParser parseSQLFunctionBody: self code ].
	self language name = 'plpgsql' ifTrue: [
		^ PostgreSQLParser parseStoredProcedureBody: self code ].
	^ nil
]
