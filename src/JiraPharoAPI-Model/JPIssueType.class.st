"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `issue` | `JPIssueType` | `type` | `JPIssue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `avatarId` | `String` | nil | |
| `description` | `String` | nil | |
| `iconUrl` | `String` | nil | |
| `id` | `Number` | nil | |
| `name` | `String` | nil | |
| `subtask` | `String` | nil | |

"
Class {
	#name : #JPIssueType,
	#superclass : #JPEntity,
	#instVars : [
		'#id => FMProperty',
		'#description => FMProperty',
		'#iconUrl => FMProperty',
		'#name => FMProperty',
		'#subtask => FMProperty',
		'#avatarId => FMProperty',
		'#issue => FMOne type: #JPIssue opposite: #type'
	],
	#category : #'JiraPharoAPI-Model-Entities'
}

{ #category : #meta }
JPIssueType class >> annotation [

	<FMClass: #IssueType super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : #comparing }
JPIssueType >> = aJPIssueType [

	<generated>
	^ aJPIssueType id = self id
]

{ #category : #accessing }
JPIssueType >> avatarId [

	<FMProperty: #avatarId type: #String>
	<generated>
	^ avatarId
]

{ #category : #accessing }
JPIssueType >> avatarId: anObject [
	<generated>
	avatarId := anObject
]

{ #category : #accessing }
JPIssueType >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
JPIssueType >> description: anObject [
	<generated>
	description := anObject
]

{ #category : #comparing }
JPIssueType >> hash [

	<generated>
	^ self id hash 
]

{ #category : #accessing }
JPIssueType >> iconUrl [

	<FMProperty: #iconUrl type: #String>
	<generated>
	^ iconUrl
]

{ #category : #accessing }
JPIssueType >> iconUrl: anObject [
	<generated>
	iconUrl := anObject
]

{ #category : #accessing }
JPIssueType >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : #accessing }
JPIssueType >> id: anObject [
	<generated>
	id := anObject
]

{ #category : #accessing }
JPIssueType >> issue [
	"Relation named: #issue type: #JPIssue opposite: #type"

	<generated>
	<derived>
	^ issue
]

{ #category : #accessing }
JPIssueType >> issue: anObject [

	<generated>
	issue := anObject
]

{ #category : #accessing }
JPIssueType >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
JPIssueType >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
JPIssueType >> subtask [

	<FMProperty: #subtask type: #String>
	<generated>
	^ subtask
]

{ #category : #accessing }
JPIssueType >> subtask: anObject [
	<generated>
	subtask := anObject
]
