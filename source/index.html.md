---
title: PagerTree API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

includes:

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

# Account

## The account object
Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
active | boolean | Does the account have an active subscript (active or trialing).
name | string | The name of the account.
token_id | string | The unique identifier of the token to use for invites to join the account.
hippanotifications | boolean | Are HIPPA notification enabled?
stripe_customer_id | string | The Stripe customer id
stripe_subscription | object | The Stripe subscription object.
stripe_customer | object | The Stripe customer object.

## Retrieve an account

### Definition

`GET https://api.pagertree.com/account/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the account to retrieve

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/account/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "acc_H1fh_yx6z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "name": "PagerTree LLC",
  "setup_complete": 1524787386,
  "token_id": "tkn_ByGE2ukxpf",
  "hippanotifications": false,
  "active": true,
  "stripe_customer_id": "cus_CkpiEkrJ40EIJd",
  "stripe_customer": {...},
  "stripe_subscription": {...}
}
```

# Team

A team represents an actual or logical team within your organization. It is comprised of [users](#the-user-obejct) that are called team members.

## The team object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"tem_ByxQ3ukgTM",
  "createdAt":"2018-04-27T00:02:51.010Z",
  "updatedAt":"2018-04-27T00:03:25.867Z",
  "name":"Devops",
  "member_user_ids":["usr_r1mnuJg6z"],
  "schedule_id":"skd_BJzQnuklaG"
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
name | string | The name of the team.
description | string | The description of the of the team.
member_user_ids | array | An array of user ids that are the team members of this team.
schedule_id | string | The on-call schedule id that belongs to this team.

## Create a team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "DevOps"}'\
  https://api.pagertree.com/team
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"tem_ByxQ3ukgTM",
  "createdAt":"2018-04-27T00:02:51.010Z",
  "updatedAt":"2018-04-27T00:03:25.867Z",
  "name":"Devops",
  "member_user_ids":[],
  "schedule_id":"skd_BJzQnuklaG"
}
```

### Definition

`POST https://api.pagertree.com/team`

### Body Parameters

Parameter | Description
--------- | -----------
name | The name of the team.

See the [team object](#the-team-object) for optional parameters.

### Returns

The newly created team object if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/team/:id
```

> The above command returns JSON structured like this:

```json
{
  "id":"tem_ByTvll-6M",
  "sid":"acc_H1fh_yx6z",
  "createdAt":"2018-04-27T18:48:04.610Z",
  "updatedAt":"2018-04-27T18:56:30.794Z",
  "name":"Devops",
  "member_user_ids":["usr_r1mnuJg6z"],
  "schedule_id":"skd_HJ-awlxZ6M"
}
```

### Definition

`GET https://api.pagertree.com/team/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the team to retrieve

### Returns
Returns a team if a valid user `id` was provided. Returns [an error](#errors) otherwise.

## Update a team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"member_user_ids": ["usr_r1mnuJg6z"]}'\
  -X PUT \
  https://api.pagertree.com/user/:id
```

> The above command returns JSON structured like this:

```json
{
  "id":"tem_ByTvll-6M",
  "sid":"acc_H1fh_yx6z",
  "createdAt":"2018-04-27T18:48:04.610Z",
  "updatedAt":"2018-04-27T18:56:30.794Z",
  "name":"Devops",
  "member_user_ids":["usr_r1mnuJg6z"],
  "schedule_id":"skd_HJ-awlxZ6M"
}
```

### Definition

`PUT https://api.pagertree.com/team/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the team to update

See the [team object](#the-team-object) for all parameters.

### Returns
The newly updated team object if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/team/:id
```

### Definition

`DELETE https://api.pagertree.com/team/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the team to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

## List all teams

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/team
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {...},
    {...},
  ],
  "has_more": false,
  "total_count": 2
}
```

### Definition

`GET https://api.pagertree.com/team`

### Returns
A paginated response with a `data` array property. Each item in the array is a team object.

# User

A user represents an actual person in your organization.

## The user object

> Example Response

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "usr_r1mnuJg6z",
  "createdAt": "2018-04-27T00:02:50.662Z",
  "updatedAt": "2018-04-27T15:35:41.139Z",
  "lastlogin": 1524787371,
  "name": "Austin",
  "email": "austinrmiller1991@gmail.com",
  "preferences": {
      "alert_slack": false,
      "alert_email": true,
      "alert_voice": false,
      "report_performance": true,
      "report_oncall": true,
      "timezone": "America/Los_Angeles",
      "wizard_dragdrop": true,
      "alert_push": true,
      "alert_sms": false,
      "wizard_quickcreate": true
  },
   "roles": {
       "broadcast": true,
       "admin": true,
       "admin_billing": true
   }
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
lastlogin | number | A unix timestamp of the last login.
name | string | The name of the user.
email | string | The email of the user.
email_verfied | number | A unix timestamp of when the user verified their email.
email_blocked | boolean | Flag indicating if PagerTree blocked this users email because of a spam or bounce response.
phone | string | The phone number of the user
phone_verified | number | A unix timestamp of when the user verified their phone.
phone_blocked | boolean | Flag indicating if PagerTree blocked this users phone because of a misuse.
preferences | object | A hash of user preferences
roles | object | A hash of user roles

## Create a user

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "Austin", "email": "austinrmiller1991@gmail.com"}'\
  https://api.pagertree.com/user
```

> The above command returns JSON structured like this:

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "usr_r1mnuJg6z",
  "createdAt": "2018-04-27T00:02:50.662Z",
  "name": "Austin",
  "email": "austinrmiller1991@gmail.com",
  "preferences": {
      "alert_push": true,
      "alert_email": true,
      "alert_email": true,
      "alert_voice": false,
      "alert_slack": false,
      "report_performance": true,
      "report_oncall": true,
  },
   "roles": {}
}
```

### Definition

`POST https://api.pagertree.com/user`

### Body Parameters

Parameter | Description
--------- | -----------
name | The name of the user.
email | The email of the user.

See the [user object](#the-user-object) for optional parameters.

### Returns

The newly created user object if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a user

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/user/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "usr_r1mnuJg6z",
  "createdAt": "2018-04-27T00:02:50.662Z",
  "updatedAt": "2018-04-27T15:35:41.139Z",
  "lastlogin": 1524787371,
  "name": "Austin",
  "email": "austinrmiller1991@gmail.com",
  "preferences": {
      "alert_slack": false,
      "alert_email": true,
      "alert_voice": false,
      "report_performance": true,
      "report_oncall": true,
      "timezone": "America/Los_Angeles",
      "wizard_dragdrop": true,
      "alert_push": true,
      "alert_sms": false,
      "wizard_quickcreate": true
  },
   "roles": {
       "broadcast": true,
       "admin": true,
       "admin_billing": true
   }
}
```

### Definition

`GET https://api.pagertree.com/user/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the user to retrieve

### Returns
Returns a user if a valid user `id` was provided. Returns [an error](#errors) otherwise.

## Update a user

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "Austin Miller"}'\
  -X PUT \
  https://api.pagertree.com/user/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "usr_r1mnuJg6z",
  "createdAt": "2018-04-27T00:02:50.662Z",
  "updatedAt": "2018-04-27T15:35:41.139Z",
  "name": "Austin Miller",
  "email": "austinrmiller1991@gmail.com",
  "preferences": {
      "alert_slack": false,
      "alert_email": true,
      "alert_voice": false,
      "report_performance": true,
      "report_oncall": true,
      "timezone": "America/Los_Angeles",
      "wizard_dragdrop": true,
      "alert_push": true,
      "alert_sms": false,
      "wizard_quickcreate": true
  },
   "roles": {
       "broadcast": true,
       "admin": true,
       "admin_billing": true
   }
}
```

### Definition

`PUT https://api.pagertree.com/user/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the user to update

See the [user object](#the-user-object) for all parameters.

### Returns
The newly updated user object if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a user

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/user/:id
```

### Definition

`DELETE https://api.pagertree.com/user/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the user to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

## List all users

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/user
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {...},
    {...},
  ],
  "has_more": false,
  "total_count": 2
}
```

### Definition

`GET https://api.pagertree.com/user`

### Returns
A paginated response with a `data` array property. Each item in the array is a user object.
