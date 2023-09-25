"
## API

- `rawData`: chane to true if you want the full json receive and no automatic Pharo converting

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
		'bearerToken',
		'rawData'
	],
	#category : #JiraPharoAPI
}

{ #category : #api }
JiraPharoAPI >> allProjects [

	self prepareZnClient.
	znClient path: self basePath , '/project/'.
	self rawData ifFalse: [
		znClient contentReader: [ :entity |
			| reader |
			reader := NeoJSONReader on: entity contents readStream.
			reader
				for: JiraPharoProject
				do: [ :mapping | mapping mapInstVars: #( key id name ) ].
			reader
				for: #ArrayOfJiraPharoProjects
				customDo: [ :mapping |
				mapping listOfElementSchema: JiraPharoProject ].

			reader nextAs: #ArrayOfJiraPharoProjects ] ].
	^ znClient get
]

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
	https := true.
	self rawData: false
]

{ #category : #accessing }
JiraPharoAPI >> isHttps [

	^ https
]

{ #category : #'api - issue' }
JiraPharoAPI >> issue: issueName [
	"https://developer.atlassian.com/cloud/jira/platform/rest/v2/api-group-issues/#api-rest-api-2-issue-issueidorkey-get"

	self prepareZnClient.
	znClient path: self basePath , '/issue/' , issueName.
	self rawData ifFalse: [
		znClient contentReader: [ :entity |
			| reader |
			reader := NeoJSONReader on: entity contents readStream.
			reader for: JiraPharoIssue do: [ :mapping |
				mapping mapInstVars: #( key id ).
				mapping
					mapProperty: 'fields'
					getter: [ :el | "Not used" ]
					setter: [ :pharoIssue :value |
						value
							at: #description
							ifPresent: [ :desc | pharoIssue description: desc ].
						value at: #summary ifPresent: [ :sum | pharoIssue summary: sum ].
						value at: #labels ifPresent: [ :labs | pharoIssue labels: labs ].
						value at: #components ifPresent: [ :cmps |
							pharoIssue components: (cmps collect: [ :cmp |
									 | localComponent |
									 localComponent := JiraPharoComponent new.
									 cmp at: #id ifPresent: [ :t | localComponent id: t ].
									 cmp at: #name ifPresent: [ :t | localComponent name: t ].
									 localComponent ]) ] ] ].
			reader nextAs: JiraPharoIssue ] ].
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
	znClient forJsonREST.
	self port ifNotNil: [ :specifiedPort | znClient port: specifiedPort ].
	self isHttps
		ifTrue: [ znClient https ]
		ifFalse: [ znClient http ].
	self bearerToken ifNotNil: [ :anApiKey |
		znClient
			headerAt: #Authorization
			put: 'Bearer ' , anApiKey ]
]

{ #category : #api }
JiraPharoAPI >> project: projectId [

	self prepareZnClient.
	znClient path: self basePath , '/project/' , projectId asString.
	self rawData ifFalse: [
		znClient contentReader: [ :entity |
			| reader |
			reader := NeoJSONReader on: entity contents readStream.
			reader
				for: JiraPharoProject
				do: [ :mapping | mapping mapInstVars: #( key id name ) ].
			reader nextAs: JiraPharoProject ] ].
	^ znClient get
]

{ #category : #accessing }
JiraPharoAPI >> rawData [

	^ rawData
]

{ #category : #accessing }
JiraPharoAPI >> rawData: anObject [

	rawData := anObject
]

{ #category : #'api - issue search' }
JiraPharoAPI >> searchIssueWithExpand: expand fields: fields fieldsByKeys: fieldsByKeys jql: jql maxResults: maxResults startAt: startAt [
	"https://developer.atlassian.com/cloud/jira/platform/rest/v2/api-group-issue-search/#api-rest-api-2-search-post"

	| dic |
	self prepareZnClient.
	znClient path: self basePath , '/search'.
	dic := Dictionary new.
	expand ifNotNil: [ :e | dic at: #expand put: e ].
	fields ifNotNil: [ :e | dic at: #fields put: e ].
	fieldsByKeys ifNotNil: [ :e | dic at: #fieldsByKeys put: e ].
	jql ifNotNil: [ :e | dic at: #jql put: e ].
	maxResults ifNotNil: [ :e | dic at: #maxResults put: e ].
	startAt ifNotNil: [ :e | dic at: #startAt put: e ].


	self rawData ifFalse: [
		znClient contentReader: [ :entity |
			| reader |
			reader := NeoJSONReader on: entity contents readStream.
			reader for: JiraPharoIssue do: [ :mapping |
				mapping mapInstVars: #( key id ).
				mapping
					mapProperty: 'fields'
					getter: [ :el | "Not used" ]
					setter: [ :pharoIssue :value |
						value
							at: #description
							ifPresent: [ :desc | pharoIssue description: desc ].
						value at: #summary ifPresent: [ :sum | pharoIssue summary: sum ].
						value at: #labels ifPresent: [ :labs | pharoIssue labels: labs ].
						value at: #components ifPresent: [ :cmps |
							pharoIssue components: (cmps collect: [ :cmp |
									 | localComponent |
									 localComponent := JiraPharoComponent new.
									 cmp at: #id ifPresent: [ :t | localComponent id: t ].
									 cmp at: #name ifPresent: [ :t | localComponent name: t ].
									 localComponent ]) ] ] ].
			reader
				for: #ArrayOfJiraPharoIssues
				customDo: [ :mapping |
				mapping listOfElementSchema: JiraPharoIssue ].

			reader for: JiraPharoIssueSearchResult do: [ :mapping |
				mapping mapInstVars: #( expand startAt maxResults total ).
				(mapping mapInstVar: #issues) valueSchema: #ArrayOfJiraPharoIssues ].

			reader nextAs: JiraPharoIssueSearchResult ] ].

	znClient contents: dic.
	^ znClient post
]
