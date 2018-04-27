# Incident

A incident represents outage, event, or occurrence.

## The incident object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"inc_H1DxGWbpG",
  "createdAt":"2018-04-27T20:02:55.098Z",
  "updatedAt":"2018-04-27T20:04:47.949Z",
  "title":"CPU usage over 95%",
  "description":"PROD APP 1 CPU load over 95% for 5 minutes.",
  "created":1524859374,
  "acknowledged":1524859483,
  "resolved":1524859487,
  "source_id":"usr_r1mnuJg6z",
  "d_team_id":"tem_ByxQ3ukgTM",
  "d_user_id":"usr_r1mnuJg6z",
  "urgency":"critical",
  "status":"resolved",
  "workflows":[{...}],
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
lastlogin | number | A unix timestamp of the last login.
title | string | The title of the incident.
description | string | The description of the incident.
created | number | The unix timestamp of when the incident was created.
acknowledged | number | The unix timestamp of when the incident was acknowledged.
resolved | number | The unix timestamp of when the incident was resolved.
source_id | string | The id of the user or integration that created this incident.
d_team_id | string | The team id of the team that the incident is assigned to.
d_user_id | string | The user id of the user that acknowledged this incident.
urgency | string | The urgency of the incident.
status | string | The status of the incident.
workflows | array | Of workflow object indicating rejects, timeouts, and acknowledged for an incident workflow.

## Create a incident

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"title":"CPU usage over 95%","description":"PROD APP 1 CPU load over 95% for 5 minutes.","urgency":"critical", "d_team_id":"tem_ByxQ3ukgTM"}'\
  https://api.pagertree.com/incident
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"inc_H1DxGWbpG",
  "createdAt":"2018-04-27T20:02:55.098Z",
  "title":"CPU usage over 95%",
  "description":"PROD APP 1 CPU load over 95% for 5 minutes.",
  "created":1524859374,
  "source_id":"usr_r1mnuJg6z",
  "d_team_id":"tem_ByxQ3ukgTM",
  "urgency":"critical",
  "status":"open"
}
```

### Definition

`POST https://api.pagertree.com/incident`

### Body Parameters

Parameter | Description
--------- | -----------
title | The title of the incident.
description | The description of the incident.
d_team_id | The destination team id of the incident.

See the [incident object](#the-incident-object) for optional parameters.

### Returns

The newly created incident object if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a incident

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/incident/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"inc_H1DxGWbpG",
  "createdAt":"2018-04-27T20:02:55.098Z",
  "updatedAt":"2018-04-27T20:04:47.949Z",
  "title":"CPU usage over 95%",
  "description":"PROD APP 1 CPU load over 95% for 5 minutes.",
  "created":1524859374,
  "acknowledged":1524859483,
  "resolved":1524859487,
  "source_id":"usr_r1mnuJg6z",
  "d_team_id":"tem_ByxQ3ukgTM",
  "d_user_id":"usr_r1mnuJg6z",
  "urgency":"critical",
  "status":"resolved",
  "workflows":[{...}]
}
```

### Definition

`GET https://api.pagertree.com/incident/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the incident to retrieve

### Returns
Returns a incident if a valid incident `id` was provided. Returns [an error](#errors) otherwise.

## Update a incident

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"urgency": "high"}'\
  -X PUT \
  https://api.pagertree.com/incident/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"inc_H1DxGWbpG",
  "createdAt":"2018-04-27T20:02:55.098Z",
  "updatedAt":"2018-04-27T20:04:47.949Z",
  "title":"CPU usage over 95%",
  "description":"PROD APP 1 CPU load over 95% for 5 minutes.",
  "created":1524859374,
  "acknowledged":1524859483,
  "resolved":1524859487,
  "source_id":"usr_r1mnuJg6z",
  "d_team_id":"tem_ByxQ3ukgTM",
  "d_user_id":"usr_r1mnuJg6z",
  "urgency":"high",
  "status":"resolved",
  "workflows":[{...}]
}
```

### Definition

`PUT https://api.pagertree.com/incident/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the incident to update

See the [incident object](#the-incident-object) for all parameters.

### Returns
The newly updated incident object if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a incident

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/incident/:id
```

### Definition

`DELETE https://api.pagertree.com/incident/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the incident to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

## List all incidents

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/incident
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

`GET https://api.pagertree.com/incident`

### Returns
A paginated response with a `data` array property. Each item in the array is a incident object.
