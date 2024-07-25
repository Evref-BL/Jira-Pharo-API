"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #JPTEntityCreator,
	#category : #'JiraPharoAPI-Model-Model'
}

{ #category : #meta }
JPTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'JiraPharoAPI-Model'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
JPTEntityCreator >> newComponent [

	<generated>
	^ self add: JPComponent new
]

{ #category : #'entity creation' }
JPTEntityCreator >> newIssue [

	<generated>
	^ self add: JPIssue new
]

{ #category : #'entity creation' }
JPTEntityCreator >> newIssueType [

	<generated>
	^ self add: JPIssueType new
]

{ #category : #'entity creation' }
JPTEntityCreator >> newProject [

	<generated>
	^ self add: JPProject new
]

{ #category : #'entity creation' }
JPTEntityCreator >> newUser [

	<generated>
	^ self add: JPUser new
]

{ #category : #'entity creation' }
JPTEntityCreator >> newWorklog [

	<generated>
	^ self add: JPWorklog new
]
