"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `components` | `JPIssue` | `issue` | `JPComponent` | |
| `type` | `JPIssue` | `issue` | `JPIssueType` | |
| `worklogs` | `JPIssue` | `issue` | `JPWorklog` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `created` | `Object` | nil | |
| `description` | `String` | nil | |
| `id` | `Number` | nil | |
| `key` | `String` | nil | |
| `labels` | `Object` | nil | |
| `summary` | `String` | nil | |
| `timespent` | `Object` | nil | |

"
Class {
	#name : #JPIssue,
	#superclass : #JPEntity,
	#instVars : [
		'#description => FMProperty',
		'#summary => FMProperty',
		'#key => FMProperty',
		'#id => FMProperty',
		'#created => FMProperty',
		'#timespent => FMProperty',
		'#labels => FMProperty',
		'#components => FMMany type: #JPComponent opposite: #issue',
		'#worklogs => FMMany type: #JPWorklog opposite: #issue',
		'#type => FMOne type: #JPIssueType opposite: #issue'
	],
	#category : #'JiraPharoAPI-Model-Entities'
}

{ #category : #meta }
JPIssue class >> annotation [

	<FMClass: #Issue super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : #adding }
JPIssue >> addComponent: anObject [
	<generated>
	^ self components add: anObject
]

{ #category : #adding }
JPIssue >> addWorklog: anObject [
	<generated>
	^ self worklogs add: anObject
]

{ #category : #accessing }
JPIssue >> components [
	"Relation named: #components type: #JPComponent opposite: #issue"

	<generated>
	<derived>
	^ components
]

{ #category : #accessing }
JPIssue >> components: anObject [

	<generated>
	components value: anObject
]

{ #category : #accessing }
JPIssue >> created [

	<FMProperty: #created type: #Object>
	<generated>
	^ created
]

{ #category : #accessing }
JPIssue >> created: anObject [
	<generated>
	created := anObject
]

{ #category : #accessing }
JPIssue >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
JPIssue >> description: anObject [
	<generated>
	description := anObject
]

{ #category : #accessing }
JPIssue >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : #accessing }
JPIssue >> id: anObject [
	<generated>
	id := anObject
]

{ #category : #accessing }
JPIssue >> key [

	<FMProperty: #key type: #String>
	<generated>
	^ key
]

{ #category : #accessing }
JPIssue >> key: anObject [
	<generated>
	key := anObject
]

{ #category : #accessing }
JPIssue >> labels [

	<FMProperty: #labels type: #Object>
	<generated>
	^ labels
]

{ #category : #accessing }
JPIssue >> labels: anObject [
	<generated>
	labels := anObject
]

{ #category : #accessing }
JPIssue >> summary [

	<FMProperty: #summary type: #String>
	<generated>
	^ summary
]

{ #category : #accessing }
JPIssue >> summary: anObject [
	<generated>
	summary := anObject
]

{ #category : #accessing }
JPIssue >> timespent [

	<FMProperty: #timespent type: #Object>
	<generated>
	^ timespent
]

{ #category : #accessing }
JPIssue >> timespent: anObject [
	<generated>
	timespent := anObject
]

{ #category : #accessing }
JPIssue >> type [
	"Relation named: #type type: #JPIssueType opposite: #issue"

	<generated>
	^ type
]

{ #category : #accessing }
JPIssue >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #accessing }
JPIssue >> worklogs [
	"Relation named: #worklogs type: #JPWorklog opposite: #issue"

	<generated>
	<derived>
	^ worklogs
]

{ #category : #accessing }
JPIssue >> worklogs: anObject [

	<generated>
	worklogs value: anObject
]
