"
I am an importer that helps people constructing correctly models.
For each request, I fullfill the Extract-Transform-Load pattern.
By analysing current model, I try to not perform extract if possible (for instance if a concept already exists).

I have few api endpoints.

- `JiraPharoImporter>>#importAllIssuesOf:` to import issues **assigned** to one person
- `JiraPharoImporter>>#importUserFromAccountID:` to import on `JPUser`
- `JiraPharoImporter>>#importAllCurrentAndPastIssuesOf:` to import issues **assigned** to one person, or that has been assigned to this person
"
Class {
	#name : 'JiraPharoImporter',
	#superclass : 'Object',
	#instVars : [
		'model',
		'api'
	],
	#category : 'JiraPharoAPI',
	#package : 'JiraPharoAPI'
}

{ #category : 'accessing' }
JiraPharoImporter >> api [

	^ api
]

{ #category : 'accessing' }
JiraPharoImporter >> api: anObject [

	api := anObject
]

{ #category : 'load' }
JiraPharoImporter >> ensureIssueType: aPotentialIssueType [
	"Search is user is already in model"

	(self model allWithType: JPIssueType)
		detect: [ :issueType | issueType = aPotentialIssueType ]
		ifOne: [ :issueTypeFromModel | ^ issueTypeFromModel ].
	^ self model add: aPotentialIssueType
]

{ #category : 'load' }
JiraPharoImporter >> ensureProject: aPotentialProject [
	"Search is user is already in model"

	(self model allWithType: JPProject)
		detect: [ :project | project = aPotentialProject ]
		ifOne: [ :projectFromModel | ^ projectFromModel ].
	^ self model add: aPotentialProject
]

{ #category : 'load' }
JiraPharoImporter >> ensureUser: aPotentialUser [
	"Search is user is already in model"

	(self model allWithType: JPUser)
		detect: [ :user | user = aPotentialUser ]
		ifOne: [ :userFromModel | ^ userFromModel ].
	^ self model add: aPotentialUser
]

{ #category : 'extraction' }
JiraPharoImporter >> extractAllIssuesFromQuery: jqlQuery [

	| issues tmp itemByPage |
	itemByPage := 100.
	('Extract all issues from query ' , jqlQuery) recordInfo.
	issues := OrderedCollection new.
	('Extract issues from ' , issues size printString , ' to '
	 , (issues size + itemByPage) printString) recordInfo.
	tmp := self api
		       searchIssueWithExpand: nil
		       fields: { '*all' }
		       fieldsByKeys: nil
		       jql: jqlQuery
		       maxResults: itemByPage
		       startAt: 0.

	issues addAll: tmp issues.
	[ tmp issues size = itemByPage ] whileTrue: [
		('Extract issues from ' , issues size printString , ' to '
		 , (issues size + itemByPage) printString) recordInfo.
		tmp := self api
			       searchIssueWithExpand: nil
			       fields: { '*all' }
			       fieldsByKeys: nil
			       jql: jqlQuery
			       maxResults: itemByPage
			       startAt: issues size.
		issues addAll: tmp issues ].
	^ issues
]

{ #category : 'extraction' }
JiraPharoImporter >> extractUserFromAccountID: accountId [

	^ self api getUser: accountId
]

{ #category : 'api - import' }
JiraPharoImporter >> importAllCurrentAndPastIssuesOf: anEmail [

	| possibleUsers modelUser issues |
	possibleUsers := self api findUserUsingQuery: anEmail.
	possibleUsers ifEmpty: [ ^ {  } ].
	modelUser := self importUserFromAccountID: possibleUsers first accountId.
	issues := self importAllIssuesFromQuery:
		          'assignee was ' , modelUser accountId.
	issues do: [ :iss | iss addHistoricallyAssigned: modelUser ].
	^ issues
]

{ #category : 'api - import' }
JiraPharoImporter >> importAllIssuesFromQuery: aQuery [

	| issues |
	issues := self extractAllIssuesFromQuery: aQuery.
	^ self loadIssues: issues.
]

{ #category : 'api - import' }
JiraPharoImporter >> importAllIssuesOf: aUsername [

	| jqlQuery |
	('Extract all issues of ' , aUsername) recordDebug.
	jqlQuery := String streamContents: [ :stream |
		            stream << 'assignee = "'.
		            stream << aUsername.
		            stream << '"' ].
	^ self importAllIssuesFromQuery: jqlQuery
]

{ #category : 'api - issue' }
JiraPharoImporter >> importIssue: aKeyOrId [

	aKeyOrId ifEmpty: [ ^ nil ].
	^ (self model allWithType: JPIssue)
		         detect: [ :modelIssue |
		         modelIssue id = aKeyOrId or: [ modelIssue key = aKeyOrId ] ]
		         ifNone: [ self model
		  							add: (self api issue: aKeyOrId) ].
	
]

{ #category : 'api - import' }
JiraPharoImporter >> importUserFromAccountID: anAccountID [

	| potentialUser |
	potentialUser := self extractUserFromAccountID: anAccountID.
	^ self ensureUser: potentialUser
]

{ #category : 'load' }
JiraPharoImporter >> loadAssigneeForIssuesToLoad: issuesToLoad [

	issuesToLoad
		reject: [ :issue | issue assignee isNil ]
		thenDo: [ :issue |
		issue assignee: (self ensureUser: issue assignee) ]
]

{ #category : 'load' }
JiraPharoImporter >> loadCreatorForIssuesToLoad: issuesToLoad [

	issuesToLoad
		reject: [ :issue | issue creator isNil ]
		thenDo: [ :issue | issue creator: (self ensureUser: issue creator) ]
]

{ #category : 'load' }
JiraPharoImporter >> loadIssues: issues [

	| issuesToLoad issuesToReturn |
	issuesToReturn := OrderedCollection new.
	issuesToLoad := OrderedCollection new.
	issues do: [ :issueProposedForImmport |
		(self model allWithType: JPIssue)
			detect: [ :issue |  issue id isNotNil and: [issue id = issueProposedForImmport id] ]
			ifFound: [ :one | issuesToReturn add: one ]
			ifNone: [
				issuesToReturn add: issueProposedForImmport.
				issuesToLoad add: issueProposedForImmport ] ].
	issuesToLoad:= self model addAll: issuesToLoad unless: [ :existing :new | existing id = new id ] .
	self loadTypeForIssuesToLoad: issuesToLoad.
	self loadWorklogsForIssuesToLoad: issuesToLoad.
	self loadCreatorForIssuesToLoad: issuesToLoad.
	self loadAssigneeForIssuesToLoad: issuesToLoad.
	self loadProjectForIssuesToLoad: issuesToLoad.
	^ issuesToReturn
]

{ #category : 'load' }
JiraPharoImporter >> loadProjectForIssuesToLoad: issuesToLoad [

	issuesToLoad
		reject: [ :issue | issue project isNil ]
		thenDo: [ :issue |
		issue project: (self ensureProject: issue project) ]
]

{ #category : 'load' }
JiraPharoImporter >> loadTypeForIssuesToLoad: issuesToLoad [

	issuesToLoad
		reject: [ :issue | issue type isNil ]
		thenDo: [ :issue | issue type: (self ensureIssueType: issue type) ]
]

{ #category : 'load' }
JiraPharoImporter >> loadWorklogsForIssuesToLoad: issuesToLoad [

	| worklogsToLoad |
	worklogsToLoad := issuesToLoad iterator
	                  | [ :issue | issue worklogs ] flatCollectIt
	                  | [ :worklog | worklog isNil ] rejectIt
	                  |
	                  [ :worklog | self model includes: worklog ]
		                  rejectIt > Set.
	"This reasign workloads to load to the correct issue in case the issue was not correctly assigned first."
	worklogsToLoad do: [ :workload |
		(self model allWithType: JPIssue)
			detect: [ :issue | issue id = workload issue id ]
			ifOne: [ :issue | workload issue: issue ] ].
	self model addAll: worklogsToLoad
]

{ #category : 'accessing' }
JiraPharoImporter >> model [

	^ model
]

{ #category : 'accessing' }
JiraPharoImporter >> model: anObject [

	model := anObject
]
