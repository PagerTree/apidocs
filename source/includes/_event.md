# Event

An event represents a calendar event. It describes a time frame (possibly repeating) where attendees are scheduled. An event is assigned to one or more schedules.

> Event Object

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"evt_HJ3eGW-6M",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "schedule_id": ["skd_xxxxxxxx"],
  "attendees": ["usr_xxxxxxxx", "usr_yyyyyyyy"],
  "layer": 1,
  "start": 1575964800,
  "end": 1576051200,
  "repeat": false,
  "timezone": "America/Los_Angeles",
  "dow": [0,1,2,3,4,5,6],
  "frequency": 1,
  "frequency_unit": "daily",
  "repeatend": 1576051200,
  "exceptions": [
    { "start": 1575964800, "event_id": "evt_xxxxxxx"}
    ...
  ],
  "next": {...}
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
schedule_id | array | Array of strings, schedule ids, this event belongs to.
attendees | array | Array of strings, user ids, that are attending this event.
layer | number | The escalation layer of this event.
start | number | The unix timestamp of when this event starts
end | number | The unix timestamp of when this events ends
repeat | boolean | Flag indicating if this is a repeating event

## Create an Event

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"schedule_id":["skd_xxxxxxxx"],"attendees": ["usr_xxxxxxxx", "usr_yyyyyyyy"], "layer": 1, "start": 1576137600, "end": 1576224000}'\
  https://api.pagertree.com/event
```

### Definition

`POST https://api.pagertree.com/event`

### Body Parameters

Parameter | Description
--------- | -----------
schedule_id | Array of schedule ids this event belongs to
attendees | Array of user ids that will be attending this event
layer | The escalation layer of the event
start | The unix timestamp of the start of the event
end | The unix timestamp of the end of the event

See the [event object](#event) for optional parameters.

### Returns

The newly created [event object](#event) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve an Event

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/event/:id
```

### Definition

`GET https://api.pagertree.com/event/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the event to retrieve

### Returns
Returns the [event object](#event) if a valid event `id` was provided. Returns [an error](#errors) otherwise.

## Update an Event

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"enabled": false}'\
  -X PUT \
  https://api.pagertree.com/event/:id
```

### Definition

`PUT https://api.pagertree.com/automation/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the event to update

### Body Parameters

See the [event object](#event) for all parameters.

### Returns
The newly updated [event object](#event) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete an Event

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/event/:id
```

### Definition

`DELETE https://api.pagertree.com/event/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the event to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

## List all Events

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/event
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

`GET https://api.pagertree.com/event`

### Returns
A paginated response with a `data` array property. Each item in the array is an [event object](#event).

