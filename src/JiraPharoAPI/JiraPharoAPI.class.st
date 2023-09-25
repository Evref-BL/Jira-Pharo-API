"
## Example

```st
jpAPI := JiraPharoAPI new.
jpAPI endpoint: '<your endpoint>'.
jpAPI basePath: '<basePath>/rest/api/latest/'.
jpAPI beHttps.
jpAPI bearerToken: '<Your personal token>'.

jpAPI issue: '<issue name>'.
```
"
Class {
	#name : #JiraPharoAPI,
	#superclass : #Object,
	#instVars : [
		'znClient',
		'port',
		'endpoint',
		'basePath',
		'https',
		'bearerToken'
	],
	#category : #JiraPharoAPI
}

{ #category : #accessing }
JiraPharoAPI >> basePath [

	^ basePath
]

{ #category : #accessing }
JiraPharoAPI >> basePath: anObject [

	basePath := anObject
]

{ #category : #accessing }
JiraPharoAPI >> beHttp [

	https := false
]

{ #category : #accessing }
JiraPharoAPI >> beHttps [

	https := true
]

{ #category : #accessing }
JiraPharoAPI >> bearerToken [

	^ bearerToken
]

{ #category : #accessing }
JiraPharoAPI >> bearerToken: anObject [

	bearerToken := anObject
]

{ #category : #accessing }
JiraPharoAPI >> endpoint [

	^ endpoint
]

{ #category : #accessing }
JiraPharoAPI >> endpoint: anObject [

	endpoint := anObject
]

{ #category : #initialization }
JiraPharoAPI >> initialize [

	super initialize.
	endpoint := 'jira.atlassian.com'.
	self basePath: '/rest/api/latest/'.
	https := true
]

{ #category : #accessing }
JiraPharoAPI >> isHttps [

	^ https
]

{ #category : #api }
JiraPharoAPI >> issue: issueName [

	self prepareZnClient.
	znClient path: (self basePath , '/issue/' , issueName).
	^ znClient get
]

{ #category : #accessing }
JiraPharoAPI >> port [

	^ port
]

{ #category : #accessing }
JiraPharoAPI >> port: anObject [

	port := anObject
]

{ #category : #'private - building' }
JiraPharoAPI >> prepareZnClient [

	znClient := ZnClient new.
	znClient host: self endpoint.
	self port ifNotNil: [ :specifiedPort | znClient port: specifiedPort ].
	self isHttps
		ifTrue: [ znClient https ]
		ifFalse: [ znClient http ].
	self bearerToken ifNotNil: [ :anApiKey |
		znClient
			headerAt: #Authorization
			put: 'Bearer ' , anApiKey ]
]
