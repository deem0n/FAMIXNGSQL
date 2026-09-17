"Only explicit CI settings are accepted: never fall back to an application database."
| environment required value |
(Smalltalk version beginsWith: 'Pharo13.') ifFalse: [
	self error: 'This CI target requires Pharo 13' ].
Smalltalk globals at: #MooseVersion ifPresent: [ :versionClass |
	versionClass current major = 13 ifFalse: [
		self error: 'The prebuilt Moose CI target requires Moose 13' ] ].
environment := Smalltalk os environment.
required := [ :name |
	value := environment at: name ifAbsent: [ self error: 'Missing CI setting: ', name ].
	value ifEmpty: [ self error: 'Empty CI setting: ', name ].
	value ].
PgScenarioTest connectionParameters:
	(PgConnection
		hostname: (required value: 'FAMIXNGSQL_TEST_HOST')
		port: (required value: 'FAMIXNGSQL_TEST_PORT') asInteger
		database: (required value: 'FAMIXNGSQL_TEST_DATABASE')
		user: (required value: 'FAMIXNGSQL_TEST_USER')
		password: (required value: 'FAMIXNGSQL_TEST_PASSWORD')).
Transcript
	show: 'Runtime: ', Smalltalk version; cr;
	show: 'Database scenarios configured for a disposable CI database.'; cr.
