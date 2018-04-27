---
title: PagerTree API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

includes:
 - account
 - alert
 - broadcast
 - event
 - incident
 - integration
 - log
 - notification
 - schedule
 - team
 - token
 - user

search: true
---

# Introduction

The PagerTree API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response code to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs which are understood by off-the-shelf http clients. We support cross-origin resource sharing, allowing you to interact securely with our API from a client-side web application. JSON is returned by all API responses, including errors.

# Authentication

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
You must replace <code>&lt;token&gt;</code> with your personal API key.
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


# Pagination
All top-level API resources have support for bluk fetches via the "list" API methods. These list API methods share a common structure, taking at least these two parameters: `limit` and `offset`.

Alternatively you may request pages by providing these two parameters: `limit` and `page`.

### Query Parameters

Parameter | Default | Description
--------- | ----------- | -----------
limit | 10 | A limit on the number of objects to be returned, between 1 and 100
offset | 0 | A cursor to use in pagination. The number of elements to skip.
page | 1 | A cursor to use in pagination. Uses the limit to calculate current offset.

### Response Format

Parameter | Type | Description
--------- | ----------- | -----------
data | array | The array of objects requested.
has_more | boolean | Whether or not there are more elements available after this request. If `false`, this list comprises the end of the set.
total_count | number | Number of total elements that exist.
