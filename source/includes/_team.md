# Team

A team represents an actual or logical team within your organization. It is comprised of [users](#the-user-object) that are called team members.

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
Returns a team if a valid team `id` was provided. Returns [an error](#errors) otherwise.

## Update a team

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"member_user_ids": ["usr_r1mnuJg6z"]}'\
  -X PUT \
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
