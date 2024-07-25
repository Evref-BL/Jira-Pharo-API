"
A JiraPharoImporterTest is a test class for testing the behavior of JiraPharoImporter
"
Class {
	#name : #JiraPharoImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'jpImporter'
	],
	#category : #'JiraPharoAPI-Tests'
}

{ #category : #test }
JiraPharoImporterTest >> setUp [

	super setUp.
	model := JPModel new.
	jpImporter := JiraPharoImporter new
		              model: model;
		              yourself
]

{ #category : #test }
JiraPharoImporterTest >> testLoadIssues [

	self assert: model size equals: 0.
	jpImporter loadIssues: { JPIssue new id: 1; yourself }.
	self assert: model size equals: 1.
]

{ #category : #tests }
JiraPharoImporterTest >> testLoadIssuesWithSameType [

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
	self assert: model size equals: 3
]

{ #category : #tests }
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

{ #category : #test }
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
