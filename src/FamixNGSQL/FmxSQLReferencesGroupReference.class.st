"
TODO

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLTReferencesGroupReference` | `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | |

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FmxSQLTReferencesGroupReference` | `outgoingReferencesGroupReferences` | `FmxSQLTWithReferencesGroupReference` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `referencesGroup` | `FmxSQLTReferencesGroupReference` | `incomingReferencesGroupReference` | `FmxSQLReferencesGroup` | |



"
Class {
	#name : 'FmxSQLReferencesGroupReference',
	#superclass : 'FmxSQLReference',
	#traits : 'FmxSQLTReferencesGroupReference',
	#classTraits : 'FmxSQLTReferencesGroupReference classTrait',
	#category : 'FamixNGSQL-Entities',
	#package : 'FamixNGSQL',
	#tag : 'Entities'
}

{ #category : 'meta' }
FmxSQLReferencesGroupReference class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ReferencesGroupReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
]
