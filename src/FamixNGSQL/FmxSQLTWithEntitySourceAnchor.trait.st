Trait {
	#name : #FmxSQLTWithEntitySourceAnchor,
	#instVars : [
		'#anchorsOnIntervalsOfCode => FMMany type: #FmxSQLEntitySourceAnchor opposite: #entity'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithEntitySourceAnchor classSide >> annotation [

	<FMClass: #TWithEntitySourceAnchor super: #Object>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithEntitySourceAnchor >> addAnchorsOnIntervalsOfCode: anObject [
	<generated>
	^ self anchorsOnIntervalsOfCode add: anObject
]

{ #category : #accessing }
FmxSQLTWithEntitySourceAnchor >> anchorsOnIntervalsOfCode [
	"Relation named: #anchorsOnIntervalsOfCode type: #FmxSQLEntitySourceAnchor opposite: #entity"

	<generated>
	<derived>
	^ anchorsOnIntervalsOfCode
]

{ #category : #accessing }
FmxSQLTWithEntitySourceAnchor >> anchorsOnIntervalsOfCode: anObject [

	<generated>
	anchorsOnIntervalsOfCode value: anObject
]
