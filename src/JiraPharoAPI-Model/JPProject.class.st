"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `id` | `Number` | nil | |
| `key` | `String` | nil | |
| `name` | `String` | nil | |

"
Class {
	#name : #JPProject,
	#superclass : #JPEntity,
	#instVars : [
		'#id => FMProperty',
		'#name => FMProperty',
		'#key => FMProperty'
	],
	#category : #'JiraPharoAPI-Model-Entities'
}

{ #category : #meta }
JPProject class >> annotation [

	<FMClass: #Project super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
JPProject >> id [

	<FMProperty: #id type: #Number>
	<generated>
	^ id
]

{ #category : #accessing }
JPProject >> id: anObject [
	<generated>
	id := anObject
]

{ #category : #accessing }
JPProject >> key [

	<FMProperty: #key type: #String>
	<generated>
	^ key
]

{ #category : #accessing }
JPProject >> key: anObject [
	<generated>
	key := anObject
]

{ #category : #accessing }
JPProject >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
JPProject >> name: anObject [
	<generated>
	name := anObject
]
