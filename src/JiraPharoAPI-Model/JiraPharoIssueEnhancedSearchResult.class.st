"
Enhanced result of the search endpoint that can be found [here](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-search/#api-rest-api-3-search-jql-post)

"
Class {
	#name : 'JiraPharoIssueEnhancedSearchResult',
	#superclass : 'Object',
	#instVars : [
		'isLast',
		'issues',
		'names',
		'nextPageToken',
		'schema'
	],
	#category : 'JiraPharoAPI-Model',
	#package : 'JiraPharoAPI-Model'
}

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> isLast [

	^ isLast
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> isLast: anObject [

	isLast := anObject
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> issues [

	^ issues
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> issues: anObject [

	issues := anObject
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> names [

	^ names
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> names: anObject [

	names := anObject
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> nextPageToken [

	^ nextPageToken
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> nextPageToken: anObject [

	nextPageToken := anObject
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> schema [

	^ schema
]

{ #category : 'accessing' }
JiraPharoIssueEnhancedSearchResult >> schema: anObject [

	schema := anObject
]
