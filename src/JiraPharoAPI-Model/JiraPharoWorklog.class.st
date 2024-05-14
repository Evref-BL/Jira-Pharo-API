Class {
	#name : #JiraPharoWorklog,
	#superclass : #Object,
	#instVars : [
		'created',
		'updated',
		'started',
		'timespent',
		'id',
		'issue',
		'author',
		'updateAuthor'
	],
	#category : #'JiraPharoAPI-Model'
}

{ #category : #accessing }
JiraPharoWorklog >> author [

	^ author
]

{ #category : #accessing }
JiraPharoWorklog >> author: anObject [

	author := anObject
]

{ #category : #accessing }
JiraPharoWorklog >> created [

	^ created
]

{ #category : #accessing }
JiraPharoWorklog >> created: anObject [

	created := anObject
]

{ #category : #accessing }
JiraPharoWorklog >> id [

	^ id
]

{ #category : #accessing }
JiraPharoWorklog >> id: anObject [

	id := anObject
]

{ #category : #accessing }
JiraPharoWorklog >> issue [

	^ issue
]

{ #category : #accessing }
JiraPharoWorklog >> issue: anObject [

	issue := anObject
]

{ #category : #accessing }
JiraPharoWorklog >> started [

	^ started
]

{ #category : #accessing }
JiraPharoWorklog >> started: anObject [

	started := anObject
]

{ #category : #accessing }
JiraPharoWorklog >> timespent [

	^ timespent
]

{ #category : #accessing }
JiraPharoWorklog >> timespent: anObject [

	timespent := anObject
]

{ #category : #accessing }
JiraPharoWorklog >> updateAuthor [

	^ updateAuthor
]

{ #category : #accessing }
JiraPharoWorklog >> updateAuthor: anObject [

	updateAuthor := anObject
]

{ #category : #accessing }
JiraPharoWorklog >> updated [

	^ updated
]

{ #category : #accessing }
JiraPharoWorklog >> updated: anObject [

	updated := anObject
]
