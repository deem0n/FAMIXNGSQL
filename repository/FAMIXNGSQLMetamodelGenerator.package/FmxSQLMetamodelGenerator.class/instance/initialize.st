initialization
initialize

	super initialize.
	
	builder := FamixMetamodelBuilder new.
	builder
		packageName: self class packageName;
		prefix: self class prefix;
		traitsFlattening: true
	