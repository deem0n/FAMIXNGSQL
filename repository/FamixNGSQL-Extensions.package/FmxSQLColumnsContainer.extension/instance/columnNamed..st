*FamixNGSQL-Extensions
columnNamed: aString
	^ self columns detect: [ :column | column name = aString ]