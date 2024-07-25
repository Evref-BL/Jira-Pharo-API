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
