"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `issue` | `JPComponent` | `components` | `JPIssue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `id` | `Number` | nil | |
| `name` | `String` | nil | |

"
Class {
	#name : 'JPComponent',
	#superclass : 'JPEntity',
	#instVars : [
		'#id => FMProperty',
		'#name => FMProperty',
		'#issue => FMOne type: #JPIssue opposite: #components'
	],
	#category : 'JiraPharoAPI-Model-Entities',
	#package : 'JiraPharoAPI-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
JPComponent class >> annotation [

	<FMClass: #Component super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
JPComponent >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : 'accessing' }
JPComponent >> id: anObject [
	<generated>
	id := anObject
]

{ #category : 'accessing' }
JPComponent >> issue [
	"Relation named: #issue type: #JPIssue opposite: #components"

	<generated>
	^ issue
]

{ #category : 'accessing' }
JPComponent >> issue: anObject [

	<generated>
	issue := anObject
]

{ #category : 'accessing' }
JPComponent >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
JPComponent >> name: anObject [
	<generated>
	name := anObject
]
