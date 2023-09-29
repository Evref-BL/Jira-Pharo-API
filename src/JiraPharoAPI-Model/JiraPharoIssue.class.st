Class {
	#name : #JiraPharoIssue,
	#superclass : #Object,
	#instVars : [
		'components',
		'description',
		'summary',
		'labels',
		'key',
		'id',
		'created',
		'issueType',
		'timespent'
	],
	#category : #'JiraPharoAPI-Model'
}

{ #category : #accessing }
JiraPharoIssue >> components [

	^ components
]

{ #category : #accessing }
JiraPharoIssue >> components: anObject [

	components := anObject
]

{ #category : #accessing }
JiraPharoIssue >> created [

	^ created
]

{ #category : #accessing }
JiraPharoIssue >> created: anObject [

	created := anObject
]

{ #category : #accessing }
JiraPharoIssue >> description [

	^ description
]

{ #category : #accessing }
JiraPharoIssue >> description: anObject [

	description := anObject
]

{ #category : #accessing }
JiraPharoIssue >> id [

	^ id
]

{ #category : #accessing }
JiraPharoIssue >> id: anObject [

	id := anObject
]

{ #category : #accessing }
JiraPharoIssue >> issueType [

	^ issueType
]

{ #category : #accessing }
JiraPharoIssue >> issueType: anObject [

	issueType := anObject
]

{ #category : #accessing }
JiraPharoIssue >> key [

	^ key
]

{ #category : #accessing }
JiraPharoIssue >> key: anObject [

	key := anObject
]

{ #category : #accessing }
JiraPharoIssue >> labels [

	^ labels
]

{ #category : #accessing }
JiraPharoIssue >> labels: anObject [

	labels := anObject
]

{ #category : #accessing }
JiraPharoIssue >> summary [

	^ summary
]

{ #category : #accessing }
JiraPharoIssue >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
JiraPharoIssue >> timespent [

	^ timespent
]

{ #category : #accessing }
JiraPharoIssue >> timespent: anObject [

	timespent := anObject
]
