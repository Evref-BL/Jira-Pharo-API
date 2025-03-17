"
A JiraPharoImporterTest is a test class for testing the behavior of JiraPharoImporter
"
Class {
	#name : 'JiraPharoImporterTest',
	#superclass : 'TestCase',
	#instVars : [
		'model',
		'jpImporter'
	],
	#category : 'JiraPharoAPI-Tests',
	#package : 'JiraPharoAPI-Tests'
}

{ #category : 'running' }
JiraPharoImporterTest >> setUp [

	super setUp.
	model := JPModel new.
	jpImporter := JiraPharoImporter new
		              model: model;
		              yourself
]

{ #category : 'tests' }
JiraPharoImporterTest >> testEnsureIssueType [

	| issueType createdIssueType |
	issueType := JPIssueType new
		             id: 12;
		             yourself.
	createdIssueType := jpImporter ensureIssueType: issueType.
	self assert: createdIssueType identicalTo: issueType
]

{ #category : 'tests' }
JiraPharoImporterTest >> testEnsureIssueTypeAlreadyExisting [

	| issueType createdIssueType issueTypeB |
	issueType := JPIssueType new
		             id: 12;
		             yourself.
	model add: issueType.
	issueTypeB := JPIssueType new
		              id: 12;
		              yourself.
	createdIssueType := jpImporter ensureIssueType: issueTypeB.
	self assert: createdIssueType identicalTo: issueType.
	self deny: createdIssueType identicalTo: issueTypeB
]

{ #category : 'tests' }
JiraPharoImporterTest >> testEnsureProject [

	| user createdUser |
	user := JPProject new
		        id: 12;
		        yourself.
	createdUser := jpImporter ensureProject: user.
	self assert: createdUser identicalTo: user
]

{ #category : 'tests' }
JiraPharoImporterTest >> testEnsureProjectAlreadyExisting [

	| project createdProject projectB |
	project := JPProject new
		           id: 12;
		           yourself.
	model add: project.
	projectB := JPProject new
		            id: 12;
		            yourself.
	createdProject := jpImporter ensureProject: projectB.
	self assert: createdProject identicalTo: project.
	self deny: createdProject identicalTo: projectB
]

{ #category : 'tests' }
JiraPharoImporterTest >> testEnsureUser [

	| user createdUser |
	user := JPUser new
		        accountId: 12;
		        yourself.
	createdUser := jpImporter ensureUser: user.
	self assert: createdUser identicalTo: user
]

{ #category : 'tests' }
JiraPharoImporterTest >> testEnsureUserAlreadyExisting [

	| user createdUser userB |
	user := JPUser new
		        accountId: 12;
		        yourself.
	model add: user.
	userB := JPUser new
		         accountId: 12;
		         yourself.
	createdUser := jpImporter ensureUser: userB.
	self assert: createdUser identicalTo: user.
	self deny: createdUser identicalTo: userB
]

{ #category : 'tests' }
JiraPharoImporterTest >> testImportIssue [

	|issue|
	issue := model newIssue id: '123'; yourself.
	
	self assert: (jpImporter importIssue: '123') equals: issue. 
	
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadAssigneeForIssuesToLoad [

	| issue assignee |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	assignee := JPUser new
		            accountId: 12;
		            yourself.
	issue assignee: assignee.

	jpImporter loadAssigneeForIssuesToLoad: { issue }.
	self assert: model size equals: 1.
	self assert: model first equals: assignee.
	self assert: issue assignee equals: assignee
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadCreatorForIssuesToLoad [

	| issue creator |
	issue := JPIssue new
		         id: 1;
		 description: 'Issue 1';
		         yourself.
	creator := JPUser new
		           accountId: 12;
		           yourself.
	issue creator: creator.

	jpImporter loadCreatorForIssuesToLoad: { issue }.
	self assert: model size equals: 1.
	self assert: model first equals: creator.
	self assert: issue creator equals: creator
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadIssueTypeForIssuesToLoad [

	| issue issueType |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	issueType := JPIssueType new
		           id: 12;
		           yourself.
	issue type: issueType.

	jpImporter loadTypeForIssuesToLoad: { issue }.
	self assert: model size equals: 1.
	self assert: issue type equals: issueType
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadIssueWithSameUserAssignedAndCreator [

	| issue assignee creator user |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	assignee := JPUser new
		            accountId: 12;
		            yourself.
	creator := JPUser new
		           accountId: 12;
		           yourself.
	issue assignee: assignee.
	issue creator: creator.

	jpImporter loadIssues: { issue }.
	self assert: model size equals: 2.
	self assert: (model allWithType: JPUser) size equals: 1.
	user := (model allWithType: JPUser) first.
	self assert: issue creator equals: user.
	self assert: issue assignee equals: user
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadIssues [

	self assert: model size equals: 0.
	jpImporter loadIssues: { JPIssue new id: 1; yourself }.
	self assert: model size equals: 1.
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadIssuesInTwoStepsWithSameIssueType [

	| issue issueB issueType issueTypeB |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	issueType := JPIssueType new
		             id: 12;
		             yourself.
	issue type: issueType.

	jpImporter loadIssues: { issue }.
	self assert: model size equals: 2.
	self assert: issue type equals: issueType.

	issueB := JPIssue new
		          id: 2;
		          description: 'Issue 1';
		          yourself.
	issueTypeB := JPIssueType new
		              id: 12;
		              yourself.
	issueB type: issueTypeB.

	jpImporter loadIssues: { issueB }.
	self assert: model size equals: 3.
	self assert: issue type equals: issueType.
	self assert: issueB type equals: issueType
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadIssuesWithSameType [

	| issueA issueB issueTypeA issueTypeB selectedIssueBySet |
	issueTypeA := JPIssueType new
		              id: 125;
		              name: 'sub-task';
		              yourself.
	issueTypeB := JPIssueType new
		              id: 125;
		              name: 'sub-task';
		              yourself.
	issueA := JPIssue new
		          id: 1;
		          type: issueTypeA;
		          yourself.
	issueB := JPIssue new
		          id: 2;
		          type: issueTypeB;
		          yourself.

	jpImporter loadIssues: {
			issueA.
			issueB }.
	self assert: model size equals: 3.
	"This is necessary because we do not know excalty the type that will be selected since they are the same"
	selectedIssueBySet := issueA type.
	self assert: issueA type identicalTo: selectedIssueBySet.
	self assert: issueB type identicalTo: selectedIssueBySet.
	self assert: selectedIssueBySet issues size equals: 2
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadIssuesWithSameTypeTypeHaveReferences [

	| issueA issueB issueTypeA issueTypeB |
	issueTypeA := JPIssueType new
		              id: 125;
		              name: 'sub-task';
		              yourself.
	issueTypeB := JPIssueType new
		              id: 125;
		              name: 'sub-task';
		              yourself.
	issueA := JPIssue new
		          id: 1;
		          type: issueTypeA;
		          yourself.
	issueB := JPIssue new
		          id: 2;
		          type: issueTypeB;
		          yourself.

	jpImporter loadIssues: {
			issueA.
			issueB }.
	self assert: (model allWithType: JPIssueType) size equals: 1.
	self
		assert: (model allWithType: JPIssueType) first issues size
		equals: 2
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadIssuesWithWorklog [

	| issue worklog |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	worklog := JPWorklog new
		           id: 12;
		           yourself.
	issue addWorklog: worklog.

	jpImporter loadIssues: { issue }.
	self assert: model size equals: 2.
	self assert: issue worklogs first equals: worklog
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadOneIssueWithAIssueType [

	| issueA issueTypeA |
	issueTypeA := JPIssueType new
		              id: 125;
		              name: 'sub-task';
		              yourself.
	issueA := JPIssue new
		          id: 1;
		          type: issueTypeA;
		          yourself.

	jpImporter loadIssues: { issueA }.
	self assert: model size equals: 2.
	self assert: (model allWithType: JPIssue) size equals: 1.
	self assert: (model allWithType: JPIssueType) size equals: 1
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadProjectForIssuesToLoad [

	| issue project |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	project := JPProject new
		           id: 12;
		           yourself.
	issue project: project.

	jpImporter loadProjectForIssuesToLoad: { issue }.
	self assert: model size equals: 1.
	self assert: issue project equals: project
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadSameIssueTwoTimes [

	jpImporter loadIssues: { (JPIssue new
			 id: 1;
			 yourself) }.
	self assert: model size equals: 1.
	jpImporter loadIssues: { (JPIssue new
			 id: 1;
			 yourself) }.
	self assert: model size equals: 1
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadSameIssueTwoTimesAndResultIsCollectionWithElementsFromModel [

	| result issueA |
	issueA := JPIssue new
		          id: 1;
		          yourself.
	jpImporter loadIssues: { issueA }.
	self assert: model size equals: 1.
	result := jpImporter loadIssues: { (JPIssue new
			           id: 1;
			           yourself) }.
	self assert: model size equals: 1.
	self assert: result first identicalTo: issueA
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadTwoIssuesWithSameAssigneeComplete [

	| issue issueB assignee assigneeB |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	issueB := JPIssue new
		          id: 1;
		          description: 'Issue 1';
		          yourself.
	assignee := JPUser new
		           accountId: 12;
		           displayName: 'John Doe';
		           yourself.
	assigneeB := JPUser new
		            accountId: 12;
		            displayName: 'John Doe';
		            yourself.
	issue assignee: assignee.
	issueB assignee: assigneeB.

	jpImporter loadIssues: {
			issue.
			issueB }.
	self assert: model size equals: 3.
	self assert: (model allWithType: JPUser) size equals: 1.
	self
		assert: (model allWithType: JPUser) first issuesAssigned size
		equals: 2.
	self assert: (model allWithType: JPIssue) size equals: 2.
	self assert: issue assignee identicalTo: issueB assignee
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadTwoIssuesWithSameAuthor [

	| issue creator issueB |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	issueB := JPIssue new
		          id: 1;
		          description: 'Issue 1';
		          yourself.
	creator := JPUser new
		           accountId: 12;
		           yourself.
	issue creator: creator.
	issueB creator: creator.

	jpImporter loadCreatorForIssuesToLoad: { issue }.
	self assert: model size equals: 1.
	self assert: model first equals: creator.
	self assert: issue creator equals: creator
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadTwoIssuesWithSameAuthorComplete [

	| issue creator issueB creatorB |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	issueB := JPIssue new
		          id: 1;
		          description: 'Issue 1';
		          yourself.
	creator := JPUser new
		           accountId: 12;
		           displayName: 'John Doe';
		           yourself.
	creatorB := JPUser new
		            accountId: 12;
		            displayName: 'John Doe';
		            yourself.
	issue creator: creator.
	issueB creator: creatorB.

	jpImporter loadIssues: {
			issue.
			issueB }.
	self assert: model size equals: 3.
	self assert: (model allWithType: JPUser) size equals: 1.
	self
		assert: (model allWithType: JPUser) first createdIssues size
		equals: 2.
	self assert: (model allWithType: JPIssue) size equals: 2.
	self assert: issue creator identicalTo: issueB creator
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadUserAsAssigneeThenCreatorOfOtherIssue [

	| issue creator issueB assigneeB |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	creator := JPUser new
		           accountId: 12;
		           yourself.
	issue creator: creator.
	jpImporter loadIssues: { issue }.
	issueB := JPIssue new
		          id: 2;
		          description: 'Issue 1';
		          yourself.
	assigneeB := JPUser new
		             accountId: 12;
		             yourself.
	issueB assignee: assigneeB.
	jpImporter loadIssues: { issueB }.
	self assert: model size equals: 3
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadUserAsCreatorThenAssigneeOfOtherIssue [

	| issue creator issueB assigneeB |
	issueB := JPIssue new
		          id: 2;
		          description: 'Issue 1';
		          yourself.
	assigneeB := JPUser new
		             accountId: 12;
		             yourself.
	issueB assignee: assigneeB.
	jpImporter loadIssues: { issueB }.
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	creator := JPUser new
		           accountId: 12;
		           yourself.
	issue creator: creator.
	jpImporter loadIssues: { issue }.

	self assert: model size equals: 3
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadWorklogsForIssuesToLoad [

	| issue worklog |
	issue := JPIssue new
		         id: 1;
		         description: 'Issue 1';
		         yourself.
	worklog := JPWorklog new
		           id: 12;
		           yourself.
	issue addWorklog: worklog.

	jpImporter loadWorklogsForIssuesToLoad: { issue }.
	self assert: model size equals: 1.
	self assert: issue worklogs first equals: worklog
]

{ #category : 'tests' }
JiraPharoImporterTest >> testLoadWorklogsForIssuesToLoadIssueIsAlreadyExistingButNotWorklog [

	| issue worklog issueB |
	issue := JPIssue new
		         id: 1;
		 description: 'Issue 1';
		         yourself.
	model add: issue.
	issueB := JPIssue new
		         id: 1;
		 description: 'Issue 1';
		         yourself.
	worklog := JPWorklog new
		           id: 12;
		           yourself.
	issueB addWorklog: worklog.

	jpImporter loadWorklogsForIssuesToLoad: { issueB }.
	self assert: model size equals: 2.
	self assert: issue worklogs first equals: worklog
]
