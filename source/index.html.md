---
title: PagerTree API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

includes:
 - account
 - alert
 - automation
 - broadcast
 - event
 - incident
 - integration
 - log
 - notification
 - router
 - schedule
 - stakeholder
 - team
 - token
 - user

search: true
---

# Introduction

The PagerTree API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response code to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs which are understood by off-the-shelf http clients. We support cross-origin resource sharing, allowing you to interact securely with our API from a client-side web application. JSON is returned by all API responses, including errors.

# Authentication

## JSON Web Token (JWT)

> To authenticate, use this code:

```shell
curl -H "Content-Type: application/json" \
  -X POST \
  -d '{"username":"<username>","password":"<password>"}' \
  https://api.pagertree.com/public/login
```

> Make sure to replace `<username>` and `<password>` with your credentials.
> The above command returns JSON structured like this:

```json
{
  "token": 1
}
```

PagerTree uses JSON Web Tokens (JWTs) to allow access to the API. You will need to login with your user credentials using the  `/public/login` endpoint.


`Authorization: <token>`

<aside class="notice">
You must replace <code>&lt;token&gt;</code> with your personal token.
</aside>

## API Key + Secret

Additionally, PagerTree can authenticate via API Key + Secret. To make a request using your API Key + Secret place them in the appropriate request headers.

`x-api-key: <key>`

`x-api-secret: <secret>`

If you do not know where to get your API Key + Secret, please [see the docs](https://pagertree.com/knowledge-base/users/#API-Key).

```shell
curl -H "Content-Type: application/json" \
  -H "x-api-key: <key>" \
  -H "x-api-secret: <secret>" \
  https://api.pagertree.com/account/:id
```

> Make sure to replace `<key>` and `<secret>` with your api key + secret.

<aside class="notice">
You must replace <code>&lt;key&gt;</code> and <code>&lt;secret&gt;</code> with your personal key + secret.
</aside>


# Errors

> An example error message

```json
{
  "errors": [
    {
      "message": "'email' is a required parameter"
    }
  ],
}
```

PagerTree uses conventional HTTP response code to indicate the success or failure of an API request. In general: codes in the `2xx` range indicate success. Codes in the `4xx` range indicate an error that failed given the information provided (e.g., a required parameter was omitted, a wrongly formatted object, etc.). Codes in the `5xx` range indicate an error with PagerTree's servers (these are rare).

Most `4xx` errors that could be handled programmatically (e.g. a bad format) include and error response that briefly explains the error.

Error Code | Meaning | Description
---------- | ------- | -----
400 | Bad Request | The request was unacceptable, often due to a missing required parameter.
401 | Unauthorized | A valid JSON `token` was not provided.
403 | Forbidden | You don't have access to the resource requested.
404 | Not Found | The resource  does not exist.
409 | Conflict | The request conflicts with another request (perhaps using the same id or key).
429 | Too Many Requests | Too many request hit the API too quickly. We recommend an exponential backoff.
500 | Internal Server Error | Something went wrong on PagerTree's servers. (These are rare.)

# Pagination and Filters
All top-level API resources have support for bulk fetches via the "list" API methods. These list API methods share a common structure, taking at least these two parameters: `limit` and `offset`.

Alternatively you may request pages by providing these two parameters: `limit` and `page`.

## Pagination Parameters

Parameter | Default | Description
--------- | ----------- | -----------
limit | 10 | A limit on the number of objects to be returned, between 1 and 100
offset | 0 | A cursor to use in pagination. The number of elements to skip.
page | 1 | A cursor to use in pagination. Uses the limit to calculate current offset.

## Response Format

Parameter | Type | Description
--------- | ----------- | -----------
data | array | The array of objects requested.
has_more | boolean | Whether or not there are more elements available after this request. If `false`, this list comprises the end of the set.
total_count | number | Number of total elements that exist.

## Filter Parameters

For any resource you are querying via the top-level API you can pass any attributes of those objects to filter on.

An example query url might look like the following:

`https://api.pagertree.com/user?name=austin`

You can also pass modifiers to modify the filters. The modifiers must be in the query parameter `ops` and have the format `<attribute_name>:<operation>`, where operation is any of the following:

## Operators

Name | Type | Comparison
---- | ---- | ----------
equals | === | attribute === value
ne | !== | attribute !== value
lt | < | attribute < value
lte | <=  | attribute <= value
gt | > | attribute > value
gte | >= | attribute >= value
beginsWith | string begins with | attribute.beginsWith(value)
contains | string or array contains | attribute.contains(value)
expand | reserved word | [see below](#expansion)

An example query url might look like the following:

`https://api.pagertree.com/user?name=austin&ops=name:beginsWith`

## Sorting

For any resource you are querying via the top-level API you can pass the `sort` parameter to query by sort.

An example query url might look like the following:

`https://api.pagertree.com/user?sort=-createdAt`

## Selecting

For any resource you are querying via the top-level API you can pass the `select` parameter to return only certain attributes. This is **highly recommended** as it will speed up your querys.

An example query url might look like the following:

`https://api.pagertree.com/user?select=sid,id`
