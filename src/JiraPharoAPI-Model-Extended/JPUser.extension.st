Extension { #name : #JPUser }

{ #category : #'*JiraPharoAPI-Model-Extended' }
JPUser >> mooseNameOn: aStream [

	aStream nextPutAll: (self displayName ifNil: [ 'no name' ])
]
