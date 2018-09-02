visiting
visitPSQLASTAttributeAccess: aPSQLASTAttributeAccess
	| identifiers |
	identifiers := nil.
	self
		visit: aPSQLASTAttributeAccess attributeIdentifier
		thenDo: [ :identifier | identifiers := PSQIdentifierWithNode identifier: identifier node: aPSQLASTAttributeAccess attributeIdentifier next: identifiers ].
	self
		visit: aPSQLASTAttributeAccess accessed
		thenDo: [ :identifier | identifiers := PSQIdentifierWithNode identifier: identifier node: aPSQLASTAttributeAccess accessed next: identifiers ].

	"We check that the identifier should be ignored (for example true or false)"
	(self shouldRejectIdentifiers: identifiers)
		ifTrue: [ ^ nil ].
	[ self resolveAndLink: identifiers ]
		on: PSQLReferenciesInconsistencies , PSQLReferenciesNotFound
		do: [ :anError | 
			"new and old are implicit declared variables in stored procedures"
			(self isImplicitVariable: identifiers identifier)
				ifTrue: [ FmxSQLLocalVariable new
						name: identifiers identifier;
						storedProcedure: self function;
						mooseModel: self model.
					self resolveAndLinkSilently: identifiers ]
				ifFalse: [ "Halt if: [ anError class = PSQLReferenciesNotFound ]".
					self errorReport addError: anError ] ].
	^ identifiers targetEntity