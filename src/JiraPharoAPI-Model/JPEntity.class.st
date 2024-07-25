Class {
	#name : #JPEntity,
	#superclass : #MooseEntity,
	#category : #'JiraPharoAPI-Model-Entities'
}

{ #category : #meta }
JPEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
JPEntity class >> isAbstract [

	<generated>
	^ self == JPEntity
]

{ #category : #meta }
JPEntity class >> metamodel [

	<generated>
	^ JPModel metamodel
]
