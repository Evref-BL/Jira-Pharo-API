"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `issue` | `JPWorklog` | `worklogs` | `JPIssue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `author` | `Object` | nil | |
| `created` | `Object` | nil | |
| `id` | `Number` | nil | |
| `started` | `Object` | nil | |
| `timespent` | `Object` | nil | |
| `updateAuthor` | `Object` | nil | |
| `updated` | `Object` | nil | |

"
Class {
	#name : #JPWorklog,
	#superclass : #JPEntity,
	#instVars : [
		'#created => FMProperty',
		'#updated => FMProperty',
		'#started => FMProperty',
		'#timespent => FMProperty',
		'#id => FMProperty',
		'#author => FMProperty',
		'#updateAuthor => FMProperty',
		'#issue => FMOne type: #JPIssue opposite: #worklogs'
	],
	#category : 'JiraPharoAPI-Model-Entities'
}

{ #category : #meta }
JPWorklog class >> annotation [

	<FMClass: #Worklog super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : #comparing }
JPWorklog >> = aJPWorklog [

	<generated>
	^ aJPWorklog id = self id
]

{ #category : #accessing }
JPWorklog >> author [

	<FMProperty: #author type: #Object>
	<generated>
	^ author
]

{ #category : #accessing }
JPWorklog >> author: anObject [
	<generated>
	author := anObject
]

{ #category : #accessing }
JPWorklog >> created [

	<FMProperty: #created type: #Object>
	<generated>
	^ created
]

{ #category : #accessing }
JPWorklog >> created: anObject [
	<generated>
	created := anObject
]

{ #category : #comparing }
JPWorklog >> hash [

	<generated>
	^ self id hash 
]

{ #category : #accessing }
JPWorklog >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : #accessing }
JPWorklog >> id: anObject [
	<generated>
	id := anObject
]

{ #category : #accessing }
JPWorklog >> issue [
	"Relation named: #issue type: #JPIssue opposite: #worklogs"

	<generated>
	^ issue
]

{ #category : #accessing }
JPWorklog >> issue: anObject [

	<generated>
	issue := anObject
]

{ #category : #accessing }
JPWorklog >> started [

	<FMProperty: #started type: #Object>
	<generated>
	^ started
]

{ #category : #accessing }
JPWorklog >> started: anObject [
	<generated>
	started := anObject
]

{ #category : #accessing }
JPWorklog >> timespent [

	<FMProperty: #timespent type: #Object>
	<generated>
	^ timespent
]

{ #category : #accessing }
JPWorklog >> timespent: anObject [
	<generated>
	timespent := anObject
]

{ #category : #accessing }
JPWorklog >> updateAuthor [

	<FMProperty: #updateAuthor type: #Object>
	<generated>
	^ updateAuthor
]

{ #category : #accessing }
JPWorklog >> updateAuthor: anObject [
	<generated>
	updateAuthor := anObject
]

{ #category : #accessing }
JPWorklog >> updated [

	<FMProperty: #updated type: #Object>
	<generated>
	^ updated
]

{ #category : #accessing }
JPWorklog >> updated: anObject [
	<generated>
	updated := anObject
]
