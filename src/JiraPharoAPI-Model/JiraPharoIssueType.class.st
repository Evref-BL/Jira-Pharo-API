Class {
	#name : #JiraPharoIssueType,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'iconUrl',
		'name',
		'subtask',
		'avatarId'
	],
	#category : #'JiraPharoAPI-Model'
}

{ #category : #accessing }
JiraPharoIssueType >> avatarId [

	^ avatarId
]

{ #category : #accessing }
JiraPharoIssueType >> avatarId: anObject [

	avatarId := anObject
]

{ #category : #accessing }
JiraPharoIssueType >> description [

	^ description
]

{ #category : #accessing }
JiraPharoIssueType >> description: anObject [

	description := anObject
]

{ #category : #accessing }
JiraPharoIssueType >> iconUrl [

	^ iconUrl
]

{ #category : #accessing }
JiraPharoIssueType >> iconUrl: anObject [

	iconUrl := anObject
]

{ #category : #accessing }
JiraPharoIssueType >> id [

	^ id
]

{ #category : #accessing }
JiraPharoIssueType >> id: anObject [

	id := anObject
]

{ #category : #accessing }
JiraPharoIssueType >> name [

	^ name
]

{ #category : #accessing }
JiraPharoIssueType >> name: anObject [

	name := anObject
]

{ #category : #accessing }
JiraPharoIssueType >> subtask [

	^ subtask
]

{ #category : #accessing }
JiraPharoIssueType >> subtask: anObject [

	subtask := anObject
]
