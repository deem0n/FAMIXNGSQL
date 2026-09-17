Class {
	#name : #FmxSQLDatabaseImportTest,
	#superclass : #PgScenarioTest,
	#category : #'FamixNGSQL-Importer-Tests'
}

{ #category : #tests }
FmxSQLDatabaseImportTest >> testRichModel [
	| model namespace table view check exclusion positive span routine trigger |
	client execute: ('
CREATE FUNCTION {1}.positive(integer) RETURNS boolean LANGUAGE sql IMMUTABLE AS $body$ SELECT $1 > 0 $body$;
CREATE FUNCTION {1}.span(integer) RETURNS int4range LANGUAGE sql IMMUTABLE AS $body$ SELECT int4range($1,$1+1) $body$;
CREATE TABLE {1}.accounts (id integer, amount integer, CONSTRAINT positive CHECK ({1}.positive(amount)), CONSTRAINT nonoverlap EXCLUDE USING gist ({1}.span(id) WITH &&));
CREATE VIEW {1}.account_view AS SELECT id,amount FROM {1}.accounts;
CREATE FUNCTION {1}.bump(requested_id integer) RETURNS integer LANGUAGE plpgsql AS $body$ BEGIN UPDATE {1}.accounts SET amount = amount + 1 WHERE id = requested_id; RETURN requested_id; END; $body$;
CREATE FUNCTION {1}.view_insert() RETURNS trigger LANGUAGE plpgsql AS $body$ BEGIN INSERT INTO {1}.accounts (id,amount) VALUES (NEW.id,NEW.amount); RETURN NEW; END; $body$;
CREATE TRIGGER view_insert INSTEAD OF INSERT ON {1}.account_view FOR EACH ROW EXECUTE FUNCTION {1}.view_insert();
' format: { schemaName }).
	model := (FmxSQLModelBuilder new
		databaseName: self class connectionParameters database;
		connection: self class connectionParameters) buildModel.
	namespace := (model allWithType: FmxSQLNamespace) detect: [ :n | n name = schemaName ].
	table := namespace namespaceEntities detect: [ :e | e name = 'accounts' ].
	view := namespace namespaceEntities detect: [ :e | e name = 'account_view' ].
	positive := namespace namespaceEntities detect: [ :e | e name = 'positive' and: [ e isStoredProcedure ] ].
	span := namespace namespaceEntities detect: [ :e | e name = 'span' ].
	check := table constraints detect: [ :c | c name = 'positive' ].
	exclusion := table constraints detect: [ :c | c name = 'nonoverlap' ].
	self assert: (check storedProceduresCalled includes: positive).
	self assert: (positive checkConstraintsCalling includes: check).
	self assert: (exclusion storedProceduresCalled includes: span).
	self assert: (span exclusionConstraintsCalling includes: exclusion).
	routine := namespace namespaceEntities detect: [ :e | e name = 'bump' ].
	self assert: routine languageName equals: 'plpgsql'.
	self assert: routine postgresOid isNotNil.
	self assert: routine queries isNotEmpty.
	self assert: routine parameters size equals: 1.
	self assert: routine parameters anyOne position equals: 1.
	self assert: (routine source includesSubstring: 'UPDATE').
	self assert: view query isNotNil.
	trigger := view triggers anyOne.
	self assert: trigger table identicalTo: view.
	self assert: trigger storedProcedure queries isNotEmpty.
	self assert: (trigger storedProcedure triggers includes: trigger).
	self assert: model entities size equals: model entities asIdentitySet size.
	self assert: model errorReport errors isEmpty
]
