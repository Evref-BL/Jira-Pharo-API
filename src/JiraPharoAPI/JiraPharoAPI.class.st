"
I am a class that comes with several utilities to import correctly a Jira model
"
Class {
	#name : 'JiraPharoAPI',
	#superclass : 'Object',
	#instVars : [
		'znClient',
		'port',
		'endpoint',
		'user',
		'basePath',
		'https',
		'apiToken',
		'bearerToken',
		'rawData',
		'generalReader'
	],
	#category : 'JiraPharoAPI',
	#package : 'JiraPharoAPI'
}

{ #category : 'api' }
JiraPharoAPI >> allProjects [

	self prepareZnClient.
	znClient path: self basePath , '/project/'.
	self rawData ifFalse: [
		znClient contentReader: [ :entity |
			| reader |
			reader := NeoJSONReader on: entity contents readStream.
			reader
				for: JPProject
				do: [ :mapping | mapping mapInstVars: #( key id name ) ].
			reader
				for: #ArrayOfJiraPharoProjects
				customDo: [ :mapping |
				mapping listOfElementSchema: JPProject ].

			reader nextAs: #ArrayOfJiraPharoProjects ] ].
	^ znClient get
]

{ #category : 'accessing' }
JiraPharoAPI >> apiToken [

	^ apiToken
]

{ #category : 'accessing' }
JiraPharoAPI >> apiToken: anObject [

	apiToken := anObject
]

{ #category : 'accessing' }
JiraPharoAPI >> basePath [

	^ basePath
]

{ #category : 'accessing' }
JiraPharoAPI >> basePath: anObject [

	basePath := anObject
]

{ #category : 'accessing' }
JiraPharoAPI >> beHttp [

	https := false
]

{ #category : 'accessing' }
JiraPharoAPI >> beHttps [

	https := true
]

{ #category : 'accessing' }
JiraPharoAPI >> bearerToken [

	^ bearerToken
]

{ #category : 'accessing' }
JiraPharoAPI >> bearerToken: anObject [

	bearerToken := anObject
]

{ #category : 'api - issue search' }
JiraPharoAPI >> configureReaderForJiraIssue: reader [

	reader
		for: #ArrayOfJiraPharoIssues
		customDo: [ :mapping | mapping listOfElementSchema: JPIssue ].

	reader for: JiraPharoIssueSearchResult do: [ :mapping |
		mapping mapInstVars: #( expand startAt maxResults total ).
		(mapping mapInstVar: #issues) valueSchema: #ArrayOfJiraPharoIssues ].
	reader for: JPIssue do: [ :mapping |
		mapping mapInstVars: #( key id ).

		mapping
			mapProperty: 'fields'
			getter: [ :el | "Not used" ]
			setter: [ :pharoIssue :value |
				value
					at: #timespent
					ifPresent: [ :ti |
					ti ifNotNil: [ pharoIssue timespent: ti seconds ] ].
				value at: #summary ifPresent: [ :sum | pharoIssue summary: sum ].
				value at: #labels ifPresent: [ :labs | pharoIssue labels: labs ].

				value at: #worklog ifPresent: [ :worklog |
					pharoIssue worklogs: ((worklog at: #worklogs) collect: [ :wl |
							 | s |
							 s := JPWorklog new
								      created: (wl at: #created) asDateAndTime;
								      yourself.
							 wl
								 at: #updated
								 ifPresent: [ :updated | s updated: updated asDateAndTime ].
							 wl
								 at: #started
								 ifPresent: [ :started | s started: started asDateAndTime ].
							 wl
								 at: #timeSpentSeconds
								 ifPresent: [ :timeSpentSeconds |
								 s timespent: timeSpentSeconds second ] ]) ].


				value at: #issuetype ifPresent: [ :issuetype |
					| createdIssueType |
					createdIssueType := JPIssueType new.
					pharoIssue type: createdIssueType.
					issuetype at: #id ifPresent: [ :t | createdIssueType id: t ].
					issuetype
						at: #description
						ifPresent: [ :t | createdIssueType description: t ].
					issuetype
						at: #iconUrl
						ifPresent: [ :t | createdIssueType iconUrl: t ].
					issuetype at: #name ifPresent: [ :t | createdIssueType name: t ].
					issuetype
						at: #subtask
						ifPresent: [ :t | createdIssueType subtask: t ].
					issuetype
						at: #avatarId
						ifPresent: [ :t | createdIssueType avatarId: t ] ].
				value
					at: #created
					ifPresent: [ :dateString |
					pharoIssue created: (Date fromString: dateString) ].
				value at: #components ifPresent: [ :cmps |
					pharoIssue components: (cmps collect: [ :cmp |
							 | localComponent |
							 localComponent := JPComponent new.
							 cmp at: #id ifPresent: [ :t | localComponent id: t ].
							 cmp at: #name ifPresent: [ :t | localComponent name: t ].

							 localComponent ]) ].
				value at: #timeestimate ifPresent: [ :timeestimate |
					timeestimate ifNotNil: [
						pharoIssue timeEstimate: timeestimate seconds ] ].
				value
					at: #timeoriginalestimate
					ifPresent: [ :timeoriginalestimate |
						timeoriginalestimate ifNotNil: [
							pharoIssue timeOriginalEstimate: timeoriginalestimate seconds ] ].
				value
					at: #project
					ifPresent: [ :project |
					pharoIssue project: (JPProject fromDictionary: project) ].
				value
					at: #creator
					ifPresent: [ :author |
					pharoIssue creator: (JPUser fromDictionary: author) ].
				value at: #assignee ifPresent: [ :assignee |
					assignee ifNotNil: [
						pharoIssue assignee: (JPUser fromDictionary: assignee) ] ] ] ]
]

{ #category : 'api - issue search' }
JiraPharoAPI >> configureReaderForJiraWorkload: reader [

	reader for: JPWorklog do: [ :mapping |
		mapping mapInstVars: #( id ).
		(mapping mapInstVar: #created) valueSchema: DateAndTime.
		(mapping mapInstVar: #updated) valueSchema: DateAndTime.
		(mapping mapInstVar: #started) valueSchema: DateAndTime ].


	reader for: #ArrayOfJiraPharoWorkload customDo: [ :customMapping |
		customMapping listOfElementSchema: JPWorklog ]
]

{ #category : 'accessing' }
JiraPharoAPI >> endpoint [

	^ endpoint
]

{ #category : 'accessing' }
JiraPharoAPI >> endpoint: anObject [

	endpoint := anObject
]

{ #category : 'accessing' }
JiraPharoAPI >> generalReader [

	^ generalReader
]

{ #category : 'accessing' }
JiraPharoAPI >> generalReader: anObject [

	generalReader := anObject
]

{ #category : 'initialization' }
JiraPharoAPI >> initialize [

	super initialize.
	endpoint := 'jira.atlassian.com'.
	self basePath: '/rest/api/latest/'.
	https := true.
	self rawData: false.
	generalReader := NeoJSONReader new.
	self configureReaderForJiraIssue: generalReader.
	self configureReaderForJiraWorkload: generalReader
]

{ #category : 'accessing' }
JiraPharoAPI >> isHttps [

	^ https
]

{ #category : 'api - issue' }
JiraPharoAPI >> issue: issueName [
	"https://developer.atlassian.com/cloud/jira/platform/rest/v2/api-group-issues/#api-rest-api-2-issue-issueidorkey-get"

	self prepareZnClient.
	znClient path: self basePath , '/issue/' , issueName.
	self rawData ifFalse: [
		znClient contentReader: [ :entity |
			generalReader nextAs: JPIssue ] ].
	^ znClient get
]

{ #category : 'accessing' }
JiraPharoAPI >> port [

	^ port
]

{ #category : 'accessing' }
JiraPharoAPI >> port: anObject [

	port := anObject
]

{ #category : 'private - building' }
JiraPharoAPI >> prepareZnClient [

	znClient := ZnClient new.
	znClient host: self endpoint.
	znClient forJsonREST.
	self port ifNotNil: [ :specifiedPort | znClient port: specifiedPort ].
	self isHttps
		ifTrue: [ znClient https ]
		ifFalse: [ znClient http ].
	"bearer or api + user"
	self bearerToken ifNotNil: [ :anApiKey |
		znClient headerAt: #Authorization put: 'Bearer ' , anApiKey ].
	self apiToken ifNotNil: [ :anApiKey |
		znClient headerAt: #Authorization put: 'Basic '
			, (self user , ':' , self apiToken) utf8Encoded base64Encoded ]
]

{ #category : 'api' }
JiraPharoAPI >> project: projectId [

	self prepareZnClient.
	znClient path: self basePath , '/project/' , projectId asString.
	self rawData ifFalse: [
		znClient contentReader: [ :entity |
			| reader |
			reader := NeoJSONReader on: entity contents readStream.
			reader
				for: JPProject
				do: [ :mapping | mapping mapInstVars: #( key id name ) ].
			reader nextAs: JPProject ] ].
	^ znClient get
]

{ #category : 'accessing' }
JiraPharoAPI >> rawData [

	^ rawData
]

{ #category : 'accessing' }
JiraPharoAPI >> rawData: anObject [

	rawData := anObject
]

{ #category : 'api - issue search' }
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
			generalReader
				on: entity contents readStream;
				nextAs: JiraPharoIssueSearchResult ] ].

	znClient contents: dic.
	^ znClient post
]

{ #category : 'accessing' }
JiraPharoAPI >> user [

	^ user
]

{ #category : 'accessing' }
JiraPharoAPI >> user: anObject [

	user := anObject
]
