Extension { #name : #FmxSQLModel }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLModel >> ensureRelationMembers [
	"Partial analysis can leave an entity linked before it is registered.
	Include the complete relation graph so MSE does not lose anchors or targets."
	| fame known pending |
	fame := FMModel withMetamodel: self metamodel.
	known := self entities asIdentitySet.
	pending := self entities asOrderedCollection copy.
	[ pending isEmpty ] whileFalse: [ | entity |
		entity := pending removeLast.
		(fame metaDescriptionOf: entity) allProperties do: [ :property |
			property type isPrimitive ifFalse: [
				(fame get: property element: entity) do: [ :related |
					((related isKindOf: MooseEntity) and: [ (known includes: related) not ]) ifTrue: [
						(related mooseModel notNil and: [ related mooseModel ~~ self ]) ifTrue: [
							self error: 'SQL relation points to an entity in another model' ].
						known add: related.
						pending add: related.
						related mooseModel: self ] ] ] ] ]
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLModel >> analysisReport [
	"Serializable companion to MSE: analysis caches are not part of the metamodel."
	| describe routines views counts |
	describe := [ :entity |
		Dictionary new
			at: 'name' put: entity name;
			at: 'schema' put: (entity parentNamespace ifNotNil: #name);
			at: 'kind' put: entity class name;
			at: 'status' put: (entity cacheAt: #analysisStatus ifAbsent: [ #untracked ]) asString;
			at: 'diagnostics' put: (entity cacheAt: #analysisDiagnostics ifAbsent: [ #() ]);
			yourself ].
	routines := ((self allWithSubTypesOf: FmxSQLStoredProcedure) reject: #isStub) collect: [ :routine |
		(describe value: routine)
			at: 'oid' put: routine postgresOid;
			at: 'language' put: routine languageName;
			yourself ].
	views := (self allWithType: FmxSQLView) collect: describe.
	counts := [ :entries | | result |
		result := Dictionary new.
		entries do: [ :entry | result at: (entry at: 'status') update: [ :count | count + 1 ] initial: [ 1 ] ].
		result ].
	^ Dictionary new
		at: 'database' put: self name;
		at: 'entityCount' put: self size;
		at: 'errorCount' put: self errorReport errors size;
		at: 'warningCount' put: self errorReport warnings size;
		at: 'routineCounts' put: (counts value: routines);
		at: 'viewCounts' put: (counts value: views);
		at: 'routines' put: routines asArray;
		at: 'views' put: views asArray;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLModel >> errorReport [
	^ self cacheAt: #errorReport
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLModel >> errorReport: anErrorReport [
	^ self cacheAt: #errorReport put: anErrorReport
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLModel >> gtInspectorErrorReportIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite fastTable
		title: 'Importation errors';
		display: [ self errorReport errors ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Index' evaluated: [ :value :ibdex | ibdex asString ] width: 50;
		column: 'Errors' evaluated: [ :value | GTObjectPrinter asTruncatedTextFrom: value ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]
