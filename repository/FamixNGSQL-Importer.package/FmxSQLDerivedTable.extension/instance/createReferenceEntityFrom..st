*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| derivedTableReference |
	derivedTableReference := FmxSQLDerivedTableReference new
		derivedTable: self;
		yourself.
	aFmxSQLEntity references add: derivedTableReference.
	^ derivedTableReference