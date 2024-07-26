Class {
	#name : #JPMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'component',
		'issue',
		'issueType',
		'project',
		'worklog',
		'user'
	],
	#category : #'JiraPharoAPI-Model-Generator'
}

{ #category : #accessing }
JPMetamodelGenerator class >> packageName [

	^ #'JiraPharoAPI-Model'
]

{ #category : #accessing }
JPMetamodelGenerator class >> prefix [

	^ #JP
]

{ #category : #definition }
JPMetamodelGenerator >> defineClasses [

	super defineClasses.

	component := builder newClassNamed: 'Component'.
	issue := builder newClassNamed: 'Issue'.
	issueType := builder newClassNamed: 'IssueType'.
	project := builder newClassNamed: 'Project'.
	worklog := builder newClassNamed: 'Worklog'.
	user := builder newClassNamed: 'User'.
]

{ #category : #definition }
JPMetamodelGenerator >> defineHierarchy [

	super defineHierarchy.
]

{ #category : #definition }
JPMetamodelGenerator >> defineProperties [

	super defineProperties.
	issue property: #description type: #String.
	issue property: #summary type: #String.
	issue property: #key type: #String.
	issue property: #id type: #Number.
	issue property: #created type: #Object.
	issue property: #timespent type: #Object.
	issue property: #labels type: #Object.

	issueType property: #id type: #Number.
	issueType property: #description type: #String.
	issueType property: #iconUrl type: #String.
	issueType property: #name type: #String.
	issueType property: #subtask type: #String.
	issueType property: #avatarId type: #String.
	issueType withEqualityCheckOn: { #id }.

	component property: #id type: #Number.
	component property: #name type: #String.

	project property: #id type: #Number.
	project property: #name type: #String.
	project property: #key type: #String.

	worklog property: #created type: #Object.
	worklog property: #updated type: #Object.
	worklog property: #started type: #Object.
	worklog property: #timespent type: #Object.
	worklog property: #id type: #Number.
	worklog property: #author type: #Object.
	worklog property: #updateAuthor type: #Object.
	worklog withEqualityCheckOn: { #id }.

	user property: #accountId type: #String.
	user property: #displayName type: #String.
	user property: #emailAddress type: #String.
	user property: #name type: #String.
	user property: #accountType type: #String
]

{ #category : #definition }
JPMetamodelGenerator >> defineRelations [

	super defineRelations.
	(issue property: #components) -* (component property: #issue).
	(issue property: #worklogs) -* (worklog property: #issue).
	(issue property: #type) *- (issueType property: #issues).
	(issue property: #creator) *-<> (user property: #createdIssues).
	(issue property: #assignee) *-<> (user property: #issuesAssigned)
]
