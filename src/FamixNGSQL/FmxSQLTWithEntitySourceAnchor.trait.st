"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `anchorsOnIntervalsOfCode` | `FmxSQLTWithEntitySourceAnchor` | `entity` | `FmxSQLEntitySourceAnchor` | |



"
Trait {
	#name : 'FmxSQLTWithEntitySourceAnchor',
	#instVars : [
		'#anchorsOnIntervalsOfCode => FMMany type: #FmxSQLEntitySourceAnchor opposite: #entity'
	],
	#category : 'FamixNGSQL-Traits',
	#package : 'FamixNGSQL',
	#tag : 'Traits'
}

{ #category : 'meta' }
FmxSQLTWithEntitySourceAnchor classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithEntitySourceAnchor super: #Object>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLTWithEntitySourceAnchor >> addAnchorsOnIntervalsOfCode: anObject [

	<ignoreForCoverage>
	<generated>
	^ self anchorsOnIntervalsOfCode add: anObject
]

{ #category : 'accessing' }
FmxSQLTWithEntitySourceAnchor >> anchorsOnIntervalsOfCode [
	"Relation named: #anchorsOnIntervalsOfCode type: #FmxSQLEntitySourceAnchor opposite: #entity"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ anchorsOnIntervalsOfCode
]

{ #category : 'accessing' }
FmxSQLTWithEntitySourceAnchor >> anchorsOnIntervalsOfCode: anObject [

	<ignoreForCoverage>
	<generated>
	anchorsOnIntervalsOfCode value: anObject
]
