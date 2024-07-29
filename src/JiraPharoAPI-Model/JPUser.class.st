"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `createdIssues` | `JPUser` | `creator` | `JPIssue` | |
| `issuesAssigned` | `JPUser` | `assignee` | `JPIssue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `accountId` | `String` | nil | |
| `accountType` | `String` | nil | |
| `displayName` | `String` | nil | |
| `emailAddress` | `String` | nil | |
| `name` | `String` | nil | |

"
Class {
	#name : 'JPUser',
	#superclass : 'JPEntity',
	#instVars : [
		'#accountId => FMProperty',
		'#displayName => FMProperty',
		'#emailAddress => FMProperty',
		'#name => FMProperty',
		'#accountType => FMProperty',
		'#createdIssues => FMMany type: #JPIssue opposite: #creator',
		'#issuesAssigned => FMMany type: #JPIssue opposite: #assignee'
	],
	#category : 'JiraPharoAPI-Model-Entities',
	#package : 'JiraPharoAPI-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
JPUser class >> annotation [

	<FMClass: #User super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : 'comparing' }
JPUser >> = aJPUser [

	<generated>
	^ aJPUser accountId = self accountId
]

{ #category : 'accessing' }
JPUser >> accountId [

	<FMProperty: #accountId type: #String>
	<generated>
	^ accountId
]

{ #category : 'accessing' }
JPUser >> accountId: anObject [
	<generated>
	accountId := anObject
]

{ #category : 'accessing' }
JPUser >> accountType [

	<FMProperty: #accountType type: #String>
	<generated>
	^ accountType
]

{ #category : 'accessing' }
JPUser >> accountType: anObject [
	<generated>
	accountType := anObject
]

{ #category : 'adding' }
JPUser >> addCreatedIssue: anObject [
	<generated>
	^ self createdIssues add: anObject
]

{ #category : 'adding' }
JPUser >> addIssuesAssigned: anObject [
	<generated>
	^ self issuesAssigned add: anObject
]

{ #category : 'accessing' }
JPUser >> createdIssues [
	"Relation named: #createdIssues type: #JPIssue opposite: #creator"

	<generated>
	<derived>
	^ createdIssues
]

{ #category : 'accessing' }
JPUser >> createdIssues: anObject [

	<generated>
	createdIssues value: anObject
]

{ #category : 'navigation' }
JPUser >> createdIssuesGroup [
	<generated>
	<navigation: 'CreatedIssues'>
	^ MooseSpecializedGroup withAll: self createdIssues asSet
]

{ #category : 'accessing' }
JPUser >> displayName [

	<FMProperty: #displayName type: #String>
	<generated>
	^ displayName
]

{ #category : 'accessing' }
JPUser >> displayName: anObject [
	<generated>
	displayName := anObject
]

{ #category : 'accessing' }
JPUser >> emailAddress [

	<FMProperty: #emailAddress type: #String>
	<generated>
	^ emailAddress
]

{ #category : 'accessing' }
JPUser >> emailAddress: anObject [
	<generated>
	emailAddress := anObject
]

{ #category : 'comparing' }
JPUser >> hash [

	<generated>
	^ self accountId hash 
]

{ #category : 'accessing' }
JPUser >> issuesAssigned [
	"Relation named: #issuesAssigned type: #JPIssue opposite: #assignee"

	<generated>
	<derived>
	^ issuesAssigned
]

{ #category : 'accessing' }
JPUser >> issuesAssigned: anObject [

	<generated>
	issuesAssigned value: anObject
]

{ #category : 'navigation' }
JPUser >> issuesAssignedGroup [
	<generated>
	<navigation: 'IssuesAssigned'>
	^ MooseSpecializedGroup withAll: self issuesAssigned asSet
]

{ #category : 'accessing' }
JPUser >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
JPUser >> name: anObject [
	<generated>
	name := anObject
]
