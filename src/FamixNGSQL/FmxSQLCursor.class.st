"
I am a cursor, a local iterator that can have parameters

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FmxSQLCursor` | `cursors` | `FmxSQLTWithCursor` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|
| `queries` | `FmxSQLTQueryContainer` | `container` | `FmxSQLCRUDQuery` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `references` | `FmxSQLCursor` | `cursor` | `FmxSQLCursorReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `anchorsOnIntervalsOfCode` | `FmxSQLTWithEntitySourceAnchor` | `entity` | `FmxSQLEntitySourceAnchor` | |



"
Class {
	#name : 'FmxSQLCursor',
	#superclass : 'FmxSQLNamedEntity',
	#traits : 'FamixTWithParameters + FmxSQLBehaviouralEntity + FmxSQLTQueryContainer',
	#classTraits : 'FamixTWithParameters classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLTQueryContainer classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FmxSQLTWithCursor opposite: #cursors',
		'#references => FMMany type: #FmxSQLCursorReference opposite: #cursor'
	],
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLCursor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Cursor super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
]

{ #category : 'adding' }
FmxSQLCursor >> addReference: anObject [

	<ignoreForCoverage>
	<generated>
	^ self references add: anObject
]

{ #category : 'testing' }
FmxSQLCursor >> isCursor [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FmxSQLCursor >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FmxSQLTWithCursor opposite: #cursors"

	<ignoreForCoverage>
	<generated>
	<container>
	^ parentBehaviouralEntity
]

{ #category : 'accessing' }
FmxSQLCursor >> parentBehaviouralEntity: anObject [

	<ignoreForCoverage>
	<generated>
	parentBehaviouralEntity := anObject
]

{ #category : 'accessing' }
FmxSQLCursor >> references [
	"Relation named: #references type: #FmxSQLCursorReference opposite: #cursor"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ references
]

{ #category : 'accessing' }
FmxSQLCursor >> references: anObject [

	<ignoreForCoverage>
	<generated>
	references value: anObject
]
