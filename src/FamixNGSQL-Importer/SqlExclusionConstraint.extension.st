Extension { #name : #SqlExclusionConstraint }

{ #category : #'*FamixNGSQL-Importer' }
SqlExclusionConstraint >> asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities [
	| constraint |
	constraint :=  FmxSQLExclusionConstraint new
			name: self name;
			table: (pgToFamixEntities at: self owner);
			source: self code;
			mooseModel: aMooseModel;
			yourself.
	self constrainedColumns
		collect: [ :pgColumn | pgToFamixEntities at: pgColumn ]
		thenDo: [ :fmxColumn |
			FmxSQLColumnReference new
				source: constraint;
				column: fmxColumn;
				isWildCardReference: false;
				isCertain: true;
				mooseModel: aMooseModel ].
	^ constraint
]
