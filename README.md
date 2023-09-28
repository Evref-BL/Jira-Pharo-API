# Jira-Pharo-API

This is a client for the [Jira REST API](https://developer.atlassian.com/cloud/jira/platform/rest/v2/intro/#about).

## Installation 

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Jira-Pharo-API' commitish: 'main' path: 'src';
  baseline: 'JiraPharoAPI';
  load
```

## Example 

### Get information about one issue

```smalltalk
jpAPI := JiraPharoAPI new.
jpAPI endpoint: '<your endpoint>'.
jpAPI basePath: '<basePath>/rest/api/latest/'.
jpAPI beHttps.
jpAPI bearerToken: '<Your personal token>'.

jpAPI issue: '<issue name>'.
```

### Get all issues of a project after a date

````smalltalk
issues := OrderedCollection new.
tmp := jpAPI searchIssueWithExpand: nil fields: {'*navigable' . 'created'} fieldsByKeys: nil jql: 'project = <projectName> and created > ''2023-01-01''' maxResults: 100 startAt: 0.

issues addAll: tmp issues.
[tmp issues isNotEmpty ] whileTrue: [ 

  tmp := jpAPI searchIssueWithExpand: nil fields: {'*navigable' . 'created'} fieldsByKeys: nil jql: 'project = <projectName> and created > ''2023-01-01''' maxResults: 100 startAt: issues size.
  issues addAll: tmp issues.
].

allJiraIssues := issues
``
