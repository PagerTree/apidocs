# User

A user represents an actual person in your organization.

> Example Response

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "usr_r1mnuJg6z",
  "createdAt": "2018-04-27T00:02:50.662Z",
  "updatedAt": "2018-04-27T15:35:41.139Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "name": "Austin Miller",
  "avatar": "https://pagertree.com/assets/img/logo/pagertree-icon-256-256.png",
  "emails": [
    {
      "email": "austinrmiller1991@gmail.com",
      "verified": 1576256550,
      "blocked": false,
      "updatedat": 1576256550,
      "verificationcode": "NkSKkyHsvPaiiABMAZFsEw19yomfygsFwU4KgK3ROa27JQLi4U4l0u9KwhLV",
      "verificationcode_updatedat": 1576256550
    },
    ...
  ],
  "phones": [
    {
      "phone": "+15303413302",
      "country": "US",
      "verified": 1576256550,
      "blocked": false,
      "updatedat": 1576256550,
      "verificationcode": "NkSKkyHsvPaiiABMAZFsEw19yomfygsFwU4KgK3ROa27JQLi4U4l0u9KwhLV",
      "verificationcode_updatedat": 1576256550,
      "sms_enabled": true,
      "voice_enabled": true,
    },
    ...
  ],
  "password": "NkSKkyHsvPaiiABMAZFsEw19yomfygsFwU4KgK3ROa27JQLi4U4l0u9KwhLV",
  "slack": {...},
  "router_id": "rtr_xxxxxxx",
  
  "preferences": {
      "alert_push": true,
      "alert_email": true,
      "alert_sms": false,
      "alert_voice": false,
      "alert_slack": false,
      "alert_goc": false,
      "advanced_mode": false,
      "debug_mode": false,
      "locale": "en",
      "timezone": "America/Los_Angeles",
      "moment_format": "LLLL",
      "ui_calendar_firstday": 0,
      ...
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
meta | object | Free form metadata.
tinyId | number | Human friendly id.
name | string | The name of the user.
avatar | string | Avatar url.
emails | array | Array of email objects.
phones | array | Array of phone objects.
password | string | Users encrypted password. (PagerTree managed)
slack | object | Slack object. (PagerTree managed)
router_id | string | A route id of for notification rules for this user
preferences | object | A hash of user preferences
roles | object | A hash of user roles

## Create a User

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "Austin Miller", "emails": [{"email": "austinrmiller1991@gmail.com"}] }'\
  https://api.pagertree.com/user
```

### Definition

`POST https://api.pagertree.com/user`

### Body Parameters

Parameter | Description
--------- | -----------
name | The name of the user.
emails | The email array for the user.

See the [user object](#user) for optional parameters.

### Returns

The newly created [user object](#user) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a User

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/user/:id
```

### Definition

`GET https://api.pagertree.com/user/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the user to retrieve

### Returns
Returns a [user object](#user) if a valid user `id` was provided. Returns [an error](#errors) otherwise.

## Update a User

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "Austin Ryan Miller"}'\
  -X PUT \
  https://api.pagertree.com/user/:id
```

### Definition

`PUT https://api.pagertree.com/user/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the user to update

See the [user object](#user) for all parameters.

### Returns
The newly updated [user object](#user) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a User

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

## List all Users

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
A paginated response with a `data` array property. Each item in the array is a [user object](#user).

## Add User to Teams

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X POST \
  -d '{"team_ids": ["tem_xxxxxx", "tem_yyyyyyy"] }'\
  https://api.pagertree.com/user/:id/add-to-teams
```

### Definition

`POST https://api.pagertree.com/user/:id/add-to-teams`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the automation to run

### Body Parameters

Parameter | Description
--------- | -----------
team_ids | Array of team ids to add the user to

### Returns
`200 - OK` if successful. Returns [an error](#errors) otherwise.
