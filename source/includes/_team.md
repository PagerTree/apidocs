# Team

A team represents an actual or logical team within your organization. It is comprised of [users](#user) that are called team members and usually points to a [schedule](#schedule) as it's on-call schedule.

> Example Response

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "tem_ByxQ3ukgTM",
  "createdAt": "2018-04-27T00:02:51.010Z",
  "updatedAt": "2018-04-27T00:03:25.867Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "name": "Devops",
  "admin_ids": ["usr_r1mnuJg6z"],
  "member_user_ids": ["usr_r1mnuJg6z"],
  "router_id": "rtr_xxxxxxxx",
  "schedule_id": "skd_BJzQnuklaG",
  "stakeholder_ids": ["stk_xxxxxxxx"],
  "preferences": {...}
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
name | string | The name of the team.
admin_ids | array | The administrators of a team
member_user_ids | array | An array of user ids that are the team members of this team.
router_id | string | The router id that processes incoming alerts to this team.
schedule_id | string | The on-call schedule id that belongs to this team.
stakeholder_ids | array | An array of stakeholder ids that are attached to alerts assigned to this team.

## Create a Team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "DevOps", "admin_ids": ["usr_r1mnuJg6z"], "member_user_ids": ["usr_r1mnuJg6z"], "schedule_id": "skd_xxxxxxxxx"}'\
  https://api.pagertree.com/team
```

### Definition

`POST https://api.pagertree.com/team`

### Body Parameters

Parameter | Description
--------- | -----------
name | The name of the team.
admin_ids | The user ids of the administrators for this team
member_user_ids | The user ids of the members for this team
schedule_id | The schedule id for this team

See the [team object](#team) for optional parameters.

### Returns

The newly created [team object](#team) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a Team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/team/:id
```

### Definition

`GET https://api.pagertree.com/team/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the team to retrieve

### Returns
Returns a [team object](#team) if a valid team `id` was provided. Returns [an error](#errors) otherwise.

## Update a Team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"stakeholder_ids": ["stk_xxxxxxx"]}'\
  -X PUT \
  https://api.pagertree.com/team/:id
```

### Definition

`PUT https://api.pagertree.com/team/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the team to update

See the [team object](#team) for all parameters.

### Returns
The newly updated [team object](#team) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a Team

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

## List all Teams

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
A paginated response with a `data` array property. Each item in the array is a [team object](#team).

## List Current Schedule Events For A Team

A convenience method, similar to the [schedule window events](#get-schedule-events-for-timeframe), that requires one less HTTP call.

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/team/:id/current-oncall
```

> The above command returns JSON structured like this:

```json
[
  {...event object...},
  {...event object...},
  ...
]
```

### Definition

`GET https://api.pagertree.com/team/:id/current-oncall`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the team to get current events for

### Returns
An array of any events in which the team is currently on-call. Each item in the array is a [event object](#event).

## List Team Members For A Team

A convenience method, to retrieve all [user objects](#user) for a team.

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/team/:id/members
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

`GET https://api.pagertree.com/team/:id/members`

### Returns
A paginated response with a `data` array property. Each item in the array is a [user object](#user).
