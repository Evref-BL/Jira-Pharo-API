Class {
	#name : 'JiraPharoIssueSearchResult',
	#superclass : 'Object',
	#instVars : [
		'expand',
		'startAt',
		'maxResults',
		'total',
		'issues'
	],
	#category : 'JiraPharoAPI-Model-Extended',
	#package : 'JiraPharoAPI-Model-Extended'
}

{ #category : 'accessing' }
JiraPharoIssueSearchResult >> issues [
	^ issues
]
