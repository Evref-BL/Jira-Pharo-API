Class {
	#name : #JiraPharoProject,
	#superclass : #Object,
	#instVars : [
		'key',
		'name',
		'id'
	],
	#category : #'JiraPharoAPI-Model'
}

{ #category : #accessing }
JiraPharoProject >> id [

	^ id
]

{ #category : #accessing }
JiraPharoProject >> id: anObject [

	id := anObject
]

{ #category : #accessing }
JiraPharoProject >> key [

	^ key
]

{ #category : #accessing }
JiraPharoProject >> key: anObject [

	key := anObject
]

{ #category : #accessing }
JiraPharoProject >> name [

	^ name
]

{ #category : #accessing }
JiraPharoProject >> name: anObject [

	name := anObject
]
