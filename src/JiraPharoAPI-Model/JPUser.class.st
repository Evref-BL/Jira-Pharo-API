"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `accountId` | `String` | nil | |
| `accountType` | `String` | nil | |
| `displayName` | `String` | nil | |
| `emailAddress` | `String` | nil | |
| `name` | `String` | nil | |

"
Class {
	#name : #JPUser,
	#superclass : #JPEntity,
	#instVars : [
		'#accountId => FMProperty',
		'#displayName => FMProperty',
		'#emailAddress => FMProperty',
		'#name => FMProperty',
		'#accountType => FMProperty'
	],
	#category : #'JiraPharoAPI-Model-Entities'
}

{ #category : #meta }
JPUser class >> annotation [

	<FMClass: #User super: #JPEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
JPUser >> accountId [

	<FMProperty: #accountId type: #String>
	<generated>
	^ accountId
]

{ #category : #accessing }
JPUser >> accountId: anObject [
	<generated>
	accountId := anObject
]

{ #category : #accessing }
JPUser >> accountType [

	<FMProperty: #accountType type: #String>
	<generated>
	^ accountType
]

{ #category : #accessing }
JPUser >> accountType: anObject [
	<generated>
	accountType := anObject
]

{ #category : #accessing }
JPUser >> displayName [

	<FMProperty: #displayName type: #String>
	<generated>
	^ displayName
]

{ #category : #accessing }
JPUser >> displayName: anObject [
	<generated>
	displayName := anObject
]

{ #category : #accessing }
JPUser >> emailAddress [

	<FMProperty: #emailAddress type: #String>
	<generated>
	^ emailAddress
]

{ #category : #accessing }
JPUser >> emailAddress: anObject [
	<generated>
	emailAddress := anObject
]

{ #category : #accessing }
JPUser >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
JPUser >> name: anObject [
	<generated>
	name := anObject
]
