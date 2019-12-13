# Schedule

A schedule represents an on-call schedule. It defines escalation rules and repetitions. [Events](#event) and [Teams](#team) point to a schedule.

> Schedule Object

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"atm_HJ3eGW-6M",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "name": "Devops On-Call Schedule",
  "type": "on_call",
  "repeat": 0,
  "rules":[
    {
      "layer":1,
      "timeout": 5,
      "unit": "m"
    },{
      "layer":2,
      "timeout":10,
      "unit": "m"
    },{
      "layer":3,
      "timeout":15,
      "unit": "m"
    }
  ],
}
```

Parameter | Type | Description
--------- | ---- | ------------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
meta | object | Free form metadata.
tinyId | number | Human friendly id.
name | string | Friendly name for the on-call schedule.
type | string | Type of schedule
repeat | number | Number of times to repeat the rules
rules | array | Escalation Rules
enabled | boolean | Flag indicating if the schedule is enabled.

## Create a Schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name":"Devops On-Call Schedule"}'\
  https://api.pagertree.com/schedule
```

### Definition

`POST https://api.pagertree.com/schedule`

### Body Parameters

Parameter | Description
--------- | -----------
name | Friendly name for the schedule

See the [schedule object](#schedule) for optional parameters.

### Returns

The newly created [schedule object](#schedule) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a Schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/schedule/:id
```

### Definition

`GET https://api.pagertree.com/schedule/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule to retrieve

### Returns
Returns the [schedule object](#schedule) if a valid schedule `id` was provided. Returns [an error](#errors) otherwise.

## Update a Schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "New name"}'\
  -X PUT \
  https://api.pagertree.com/schedule/:id
```

### Definition

`PUT https://api.pagertree.com/schedule/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule to update

### Body Parameters

See the [schedule object](#schedule) for all parameters.

### Returns
The newly updated [schedule object](#schedule) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a Schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/schedule/:id
```

### Definition

`DELETE https://api.pagertree.com/schedule/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule to delete

### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

#### Notes
This could have unintended consequences if referenced by [teams](#teams) or [routers](#router).

## List all Schedules

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/schedule
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

`GET https://api.pagertree.com/schedule`

### Returns
A paginated response with a `data` array property. Each item in the array is an [schedule object](#schedule).

## Get Schedule Events For Timeframe

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X POST \
  https://api.pagertree.com/schedule/:id/window-events
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

`POST https://api.pagertree.com/schedule/:id/window-events?start=1576137600&end=1576224000`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule

### Query Parameters

Parameter | Description
--------- | -----------
start | Unix timestamp of the start of the timeframe
end | Unix timestamp of the end of the timeframe

### Returns
A paginated response with a `data` array property. Each item in the array is an [event object](#schedule).

## Flush a Schedule

Deletes all events associated with a schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/schedule/:id/flush
```

### Definition

`DELETE https://api.pagertree.com/schedule/:id/flush`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule to flush

### Returns

`200 - OK` if the request succeeded. Returns [an error](#errors) otherwise.
