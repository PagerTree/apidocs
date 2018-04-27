# Event

An event represents a calendar event. It can be one time or recurring.

## The event object

> Example Response

```json
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
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
schedule_id | string | The schedule id that this event belongs to.
user_id | string | The user id that this event belongs to.
layer | number | The layer of this event.
start | number | A unix timestamp of when the event starts.
end | number | A unix timestamp of when the event ends.
repeat | boolean | Flag indicating if this is a reoccurring event.
repeatend | number | A unix timestamp of when the repeating event ends.
p_event_id | string | If this event is recurring, and a modified occurrence, the parent event id of the repeating event.
dow | array | Array of days of the week this event repeats on 1 (Monday) - 7 (Sunday). [ISO Week Date](https://en.wikipedia.org/wiki/ISO_week_date)
frequency | number | Number of days between repeats.
exceptions | object | An array of unix timestamps of the start date of the exceptions.

## Create a event

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"schedule_id":"skd_BJzQnuklaG","user_id":"usr_r1mnuJg6z","start":1524898800,"end":1524985200}'\
  https://api.pagertree.com/event
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"evt_rJ0XMGWTM",
  "createdAt":"2018-04-27T21:12:05.774Z",
  "schedule_id":"skd_BJzQnuklaG",
  "user_id":"usr_r1mnuJg6z",
  "layer":1,
  "start":1524898800,
  "end":1524985200,
  "repeat":false,
  "dow":[1,2,3,4,5,6,7],
  "frequency":1,
  "exceptions":[]
}
```

### Definition

`POST https://api.pagertree.com/event`

### Body Parameters

Parameter | Description
--------- | -----------
schedule_id | The id of the schedule that this event belongs to.
user_id | The id of the user that this event belongs to.
start | The start timestamp (unix) of the event.
end | The end timestamp (unix) of the event.

See the [event object](#the-event-object) for optional parameters.

### Returns

The newly created event object if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a event

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/event/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"evt_S1mmhd1gaM",
  "createdAt":"2018-04-27T00:02:51.374Z",
  "updatedAt":"2018-04-27T21:30:46.258Z",
  "schedule_id":"skd_BJzQnuklaG","repeat":true,
  "user_id":"usr_r1mnuJg6z",
  "layer":1,
  "start":1524726000,
  "end":1524812400,
  "dow":[1,2,3,4,5,6,7],
  "frequency":1,
  "exceptions": [
    {
      "start":1526022000,
      "event_id":null
    }
  ]
}
```

### Definition

`GET https://api.pagertree.com/event/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the event to retrieve

### Returns
Returns a event if a valid event `id` was provided. Returns [an error](#errors) otherwise.

## Update a event

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"layer": 2}'\
  -X PUT \
  https://api.pagertree.com/event/:id
```

> The above command returns JSON structured like this:

```json
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
```

### Definition

`PUT https://api.pagertree.com/event/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the event to update

See the [event object](#the-event-object) for all parameters.

### Returns
The newly updated event object if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a event

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

## List all events

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
A paginated response with a `data` array property. Each item in the array is a event object.
