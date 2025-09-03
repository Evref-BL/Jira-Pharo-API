Class {
	#name : 'JiraPharoIssueSearchResult',
	#superclass : 'JiraPharoIssueEnhancedSearchResult',
	#instVars : [
		'expand',
		'startAt',
		'maxResults',
		'total'
	],
	#category : 'JiraPharoAPI-Model',
	#package : 'JiraPharoAPI-Model'
}

{ #category : 'deprecation' }
JiraPharoIssueSearchResult class >> isDeprecated [
	^ true
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> expand [

	^ expand
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> expand: anObject [

	expand := anObject
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> maxResults [

	^ maxResults
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> maxResults: anObject [

	maxResults := anObject
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> startAt [

	^ startAt
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> startAt: anObject [

	startAt := anObject
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> total [

	^ total
]

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> total: anObject [

	total := anObject
]
