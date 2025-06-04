"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `project` | `JPVersion` | `versions` | `JPProject` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `issues` | `JPVersion` | `version` | `JPIssue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `archived` | `Boolean` | nil | |
| `description` | `String` | nil | |
| `id` | `Number` | nil | |
| `name` | `String` | nil | |
| `overdue` | `Boolean` | nil | |
| `released` | `Boolean` | nil | |
| `releasedDate` | `Object` | nil | |
| `url` | `String` | nil | |
| `userReleasedDate` | `Object` | nil | |

"
Class {
	#name : 'JPVersion',
	#superclass : 'JPEntity',
	#instVars : [
		'#id => FMProperty',
		'#description => FMProperty',
		'#name => FMProperty',
		'#overdue => FMProperty',
		'#archived => FMProperty',
		'#released => FMProperty',
		'#releasedDate => FMProperty',
		'#userReleasedDate => FMProperty',
		'#url => FMProperty',
		'#project => FMOne type: #JPProject opposite: #versions',
		'#issues => FMMany type: #JPIssue opposite: #version'
	],
	#category : 'JiraPharoAPI-Model-Entities',
	#package : 'JiraPharoAPI-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
JPVersion class >> annotation [

	<FMClass: #Version super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : 'comparing' }
JPVersion >> = aJPVersion [

	<generated>
	^ aJPVersion id = self id
]

{ #category : 'adding' }
JPVersion >> addIssue: anObject [
	<generated>
	^ self issues add: anObject
]

{ #category : 'accessing' }
JPVersion >> archived [

	<FMProperty: #archived type: #Boolean>
	<generated>
	^ archived
]

{ #category : 'accessing' }
JPVersion >> archived: anObject [
	<generated>
	archived := anObject
]

{ #category : 'accessing' }
JPVersion >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : 'accessing' }
JPVersion >> description: anObject [
	<generated>
	description := anObject
]

{ #category : 'comparing' }
JPVersion >> hash [

	<generated>
	^ self id hash 
]

{ #category : 'accessing' }
JPVersion >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : 'accessing' }
JPVersion >> id: anObject [
	<generated>
	id := anObject
]

{ #category : 'accessing' }
JPVersion >> issues [
	"Relation named: #issues type: #JPIssue opposite: #version"

	<generated>
	<derived>
	^ issues
]

{ #category : 'accessing' }
JPVersion >> issues: anObject [

	<generated>
	issues value: anObject
]

{ #category : 'navigation' }
JPVersion >> issuesGroup [
	<generated>
	<navigation: 'Issues'>
	^ MooseSpecializedGroup withAll: self issues asSet
]

{ #category : 'accessing' }
JPVersion >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
JPVersion >> name: anObject [
	<generated>
	name := anObject
]

{ #category : 'accessing' }
JPVersion >> overdue [

	<FMProperty: #overdue type: #Boolean>
	<generated>
	^ overdue
]

{ #category : 'accessing' }
JPVersion >> overdue: anObject [
	<generated>
	overdue := anObject
]

{ #category : 'accessing' }
JPVersion >> project [
	"Relation named: #project type: #JPProject opposite: #versions"

	<generated>
	<container>
	^ project
]

{ #category : 'accessing' }
JPVersion >> project: anObject [

	<generated>
	project := anObject
]

{ #category : 'navigation' }
JPVersion >> projectGroup [
	<generated>
	<navigation: 'Project'>
	^ MooseSpecializedGroup with: self project
]

{ #category : 'accessing' }
JPVersion >> released [

	<FMProperty: #released type: #Boolean>
	<generated>
	^ released
]

{ #category : 'accessing' }
JPVersion >> released: anObject [
	<generated>
	released := anObject
]

{ #category : 'accessing' }
JPVersion >> releasedDate [

	<FMProperty: #releasedDate type: #Object>
	<generated>
	^ releasedDate
]

{ #category : 'accessing' }
JPVersion >> releasedDate: anObject [
	<generated>
	releasedDate := anObject
]

{ #category : 'accessing' }
JPVersion >> url [

	<FMProperty: #url type: #String>
	<generated>
	^ url
]

{ #category : 'accessing' }
JPVersion >> url: anObject [
	<generated>
	url := anObject
]

{ #category : 'accessing' }
JPVersion >> userReleasedDate [

	<FMProperty: #userReleasedDate type: #Object>
	<generated>
	^ userReleasedDate
]

{ #category : 'accessing' }
JPVersion >> userReleasedDate: anObject [
	<generated>
	userReleasedDate := anObject
]
