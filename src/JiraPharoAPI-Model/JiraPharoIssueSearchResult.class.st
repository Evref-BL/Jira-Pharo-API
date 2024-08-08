Class {
	#name : #JiraPharoIssueSearchResult,
	#superclass : #Object,
	#instVars : [
		'expand',
		'startAt',
		'maxResults',
		'total',
		'issues'
	],
	#category : 'JiraPharoAPI-Model'
}

{ #category : #accessing }
JiraPharoIssueSearchResult >> expand [

	^ expand
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> expand: anObject [

	expand := anObject
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> issues [

	^ issues
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> issues: anObject [

	issues := anObject
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> maxResults [

	^ maxResults
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> maxResults: anObject [

	maxResults := anObject
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> startAt [

	^ startAt
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> startAt: anObject [

	startAt := anObject
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> total [

	^ total
]

{ #category : #accessing }
JiraPharoIssueSearchResult >> total: anObject [

	total := anObject
]
