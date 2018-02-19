definitions - FAMIX
defineFamixMetaModelEntitiesProperties
	tNamedEntity
		property: #name type: #String.
		
	(sourcedEntity as: #TSourcedEntity)
		property: #sourceCode type: #String.
		
	(sourceAnchor as: #TSourceAnchor)
		property: #lineBegin type: #Integer;
		property: #lineEnd type: #Integer;
		property: #columnBegin type: #Integer;
		property: #columnEnd type: #Integer