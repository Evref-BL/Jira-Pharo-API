Extension { #name : #JPIssue }

{ #category : #'*JiraPharoAPI-Model-Extended' }
JPIssue >> mooseNameOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: (self key ifNil: [ 'no key' ]);
		nextPutAll: ') ';
		nextPutAll: (self summary ifNil: [ 'no summary' ])
]

{ #category : #'*JiraPharoAPI-Model-Extended' }
JPIssue >> printOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self key;
		nextPutAll: ') ';
		nextPutAll: self summary
]
