"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `issues` | `JPProject` | `project` | `JPIssue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `id` | `Number` | nil | |
| `key` | `String` | nil | |
| `name` | `String` | nil | |

"
Class {
	#name : 'JPProject',
	#superclass : 'JPEntity',
	#instVars : [
		'#id => FMProperty',
		'#issues => FMMany type: #JPIssue opposite: #project',
		'#key => FMProperty',
		'#name => FMProperty'
	],
	#category : 'JiraPharoAPI-Model-Entities',
	#package : 'JiraPharoAPI-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
JPProject class >> annotation [

	<FMClass: #Project super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : 'comparing' }
JPProject >> = aJPProject [

	<generated>
	^ aJPProject id = self id
]

{ #category : 'adding' }
JPProject >> addIssue: anObject [
	<generated>
	^ self issues add: anObject
]

{ #category : 'comparing' }
JPProject >> hash [

	<generated>
	^ self id hash 
]

{ #category : 'accessing' }
JPProject >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : 'accessing' }
JPProject >> id: anObject [
	<generated>
	id := anObject
]

{ #category : 'accessing' }
JPProject >> issues [
	"Relation named: #issues type: #JPIssue opposite: #project"

	<generated>
	<derived>
	^ issues
]

{ #category : 'accessing' }
JPProject >> issues: anObject [

	<generated>
	issues value: anObject
]

{ #category : 'navigation' }
JPProject >> issuesGroup [
	<generated>
	<navigation: 'Issues'>
	^ MooseSpecializedGroup withAll: self issues asSet
]

{ #category : 'accessing' }
JPProject >> key [

	<FMProperty: #key type: #String>
	<generated>
	^ key
]

{ #category : 'accessing' }
JPProject >> key: anObject [
	<generated>
	key := anObject
]

{ #category : 'accessing' }
JPProject >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
JPProject >> name: anObject [
	<generated>
	name := anObject
]
