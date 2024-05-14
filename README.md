# Jira-Pharo-API

This is a client for the [Jira REST API](https://developer.atlassian.com/cloud/jira/platform/rest/v2/intro/#about).

## Installation 

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Jira-Pharo-API' commitish: 'main' path: 'src';
  baseline: 'JiraPharoAPI';
  load
```

## Connect the API to Jira

The first step before querying is to connect to the Jira API.

On the official atlassian Jira, perform the following script:

```smalltalk
jpAPI := JiraPharoAPI new.
jpAPI endpoint: '<your endpoint>'.
jpAPI basePath: '<basePath>/rest/api/latest/'.
jpAPI beHttps.

jpAPI user: '<Your usernam (can be email)>'.
jpAPI apiToken: '<Your apiToken>'.
```

If you still have a olf self-hosted Jira, you might want to use the following script.

```smalltalk
jpAPI := JiraPharoAPI new.
jpAPI endpoint: '<your endpoint>'.
jpAPI basePath: '<basePath>/rest/api/latest/'.
jpAPI beHttps.
jpAPI bearerToken: '<Your personal token>'.
```

## Example 

### Get information about one issue

```smalltalk
jpAPI issue: '<issue name>'.
```

### Search issue API

We define the API to search issues using the [JQL](https://confluence.atlassian.com/x/egORLQ) query language of Atlassian.
We propose here some example but you can do a lot more.

#### Get all issues of a project after a date

```smalltalk
issues := OrderedCollection new.
tmp := jpAPI searchIssueWithExpand: nil fields: {'*navigable' . 'created'} fieldsByKeys: nil jql: 'project = <projectName> and created > ''2023-01-01''' maxResults: 100 startAt: 0.

issues addAll: tmp issues.
[tmp issues isNotEmpty ] whileTrue: [ 

  tmp := jpAPI searchIssueWithExpand: nil fields: {'*navigable' . 'created'} fieldsByKeys: nil jql: 'project = <projectName> and created > ''2023-01-01''' maxResults: 100 startAt: issues size.
  issues addAll: tmp issues.
].

allJiraIssues := issues
```

#### Search all issues assigned to a user

```smalltalk
issues := OrderedCollection new.
tmp := jpAPI searchIssueWithExpand: nil fields: {'*navigable' . 'created'} fieldsByKeys: nil jql: 'assignee = "user.name@email.fr"' maxResults: 100 startAt: 0.

issues addAll: tmp issues.
[tmp issues isNotEmpty ] whileTrue: [ 

  tmp := jpAPI searchIssueWithExpand: nil fields: {'*navigable' . 'created'} fieldsByKeys: nil jql: 'assignee = "user.name@email.fr"' maxResults: 100 startAt: issues size.
  issues addAll: tmp issues.
].

allJiraIssues := issues
```
