# Incident

An incident is an [alert](#alert) that has been flagged as an incident. Please use the [alert](#alert) api as these endpoints are **DEPRECATED** and only provided as convinience. It's possible they be removed at any time.

See the [alert](#alert) object for details.

## Create an Incident

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"title":"DDoS Attack","destination_ids: ["tem_xxxxxxxx"]"}'\
  https://api.pagertree.com/incident
```

### Definition

`POST https://api.pagertree.com/incident`

### Body Parameters

Parameter | Description
--------- | -----------
title | The title of the alert.
destination_ids | An array of ids (user/team) to route the alert to.

See the [alert object](#alert) for optional parameters.

### Returns

The newly created [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve an Incident

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/incident/:id
```

### Definition

`GET https://api.pagertree.com/incident/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the incident to retrieve

### Returns
Returns the [alert object](#alert) if a valid incident `id` was provided. Returns [an error](#errors) otherwise.

## Update an Incident

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"meta": {"incident": true, "incident_severity": "SEV-1", "incident_message": "Please call into the bridge 1-800-123-4567"}}'\
  -X PUT \
  https://api.pagertree.com/incident/:id
```

### Definition

`PUT https://api.pagertree.com/incident/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the incident to update

### Body Parameters

See the [alert object](#alert) for all parameters.

### Returns
The newly updated [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete an Incident

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
id | The id of the alert to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

## List all Incidents

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
A paginated response with a `data` array property. Each item in the array is an [alert object](#alert).

## Get Incident Logs

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/incident/:id/logs
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

`GET https://api.pagertree.com/incident/:id/logs`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the incident to get logs for

### Returns
A paginated response with a `data` array property. Each item in the array is an [log object](#log).
