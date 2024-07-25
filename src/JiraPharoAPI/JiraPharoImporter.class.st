"
I am an importer that helps people constructing correctly models.
For each request, I fullfill the Extract-Transform-Load pattern.
By analysing current model, I try to not perform extract if possible (for instance if a concept already exists).
"
Class {
	#name : #JiraPharoImporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'api'
	],
	#category : #JiraPharoAPI
}

{ #category : #accessing }
JiraPharoImporter >> api [

	^ api
]

{ #category : #accessing }
JiraPharoImporter >> api: anObject [

	api := anObject
]

{ #category : #'api - import' }
JiraPharoImporter >> extractAllIssuesOf: aUsername [

	| issues jqlQuery tmp |
	jqlQuery := String streamContents: [ :stream |
		            stream << 'assignee = "'.
		            stream << aUsername.
		            stream << '"' ].
	issues := OrderedCollection new.
	tmp := self api
		       searchIssueWithExpand: nil
		       fields: { '*all' }
		       fieldsByKeys: nil
		       jql: jqlQuery
		       maxResults: 100
		       startAt: 0.

	issues addAll: tmp issues.
	[ tmp issues isNotEmpty ] whileTrue: [
		tmp := self api
			       searchIssueWithExpand: nil
			       fields: { '*all' }
			       fieldsByKeys: nil
			       jql: jqlQuery
			       maxResults: 100
			       startAt: issues size.
		issues addAll: tmp issues ].
	^ issues
]

{ #category : #'api - import' }
JiraPharoImporter >> importAllIssuesOf: aUsername [

	| issues |
	issues := self extractAllIssuesOf: aUsername.
	self loadIssues: issues.
]

{ #category : #'api - import' }
JiraPharoImporter >> loadIssues: issues [

	| issuesToLoad |
	issuesToLoad := issues reject: [ :issueProposedForImmport |
		                (self model allWithType: JPIssue) anySatisfy: [
			                :issue | issue id = issueProposedForImmport id ] ].
	self model addAll: issuesToLoad.
	self model addAll:
		issuesToLoad iterator | [ :issue | issue type ] collectIt
		| [ :issueType | issueType isNil ] rejectIt > Set
]

{ #category : #accessing }
JiraPharoImporter >> model [

	^ model
]

{ #category : #accessing }
JiraPharoImporter >> model: anObject [

	model := anObject
]
