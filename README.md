# Jira-Pharo-API

This is a client for the [Jira REST API](https://developer.atlassian.com/cloud/jira/software/rest/intro/).

## Installation 

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Jira-Pharo-API' commitish: 'main' path: 'src';
  baseline: 'JiraPharoAPI';
  load
```

## Example 

```smalltalk
jpAPI := JiraPharoAPI new.
jpAPI endpoint: '<your endpoint>'.
jpAPI basePath: '<basePath>/rest/api/latest/'.
jpAPI beHttps.
jpAPI bearerToken: '<Your personal token>'.

jpAPI issue: '<issue name>'.
```
