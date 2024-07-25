Extension { #name : #JPIssue }

{ #category : #'*JiraPharoAPI-Model-Extended' }
JPIssue >> mooseNameOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self key;
		nextPutAll: ') ';
		nextPutAll: self summary
]

{ #category : #'*JiraPharoAPI-Model-Extended' }
JPIssue >> printOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self key;
		nextPutAll: ') ';
		nextPutAll: self summary
]
