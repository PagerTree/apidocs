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

## List all current events for a user

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/user/:id/currentevents
```

> The above command returns JSON structured like this:

```json
[
  {
    "sid":"acc_H1fh_yx6z",
    "id":"evt_rJ0XMGWTM",
    "createdAt":"2018-04-27T21:12:05.774Z",
    "updatedAt":"2018-04-27T21:22:47.927Z",
    "schedule_id":"skd_BJzQnuklaG",
    "user_id":"usr_r1mnuJg6z",
    "start":1524898800,
    "end":1524985200,
    "repeat":false,
    "layer":2,
    "dow":[1,2,3,4,5,6,7],
    "frequency":1,
    "exceptions":[]
  }
]
```

### Definition

`GET https://api.pagertree.com/user/:id/currentevents`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the user to get current events for

### Returns
An array of any events in which the user is currently on-call for. Each item in the array is a event object.
