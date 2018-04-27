# Schedule

A schedule represents an on-call schedule for a [team](#the-team-object). It defines escalation rules and repetitions. [Events](#the-event-object) and [Teams][#the-team-object] point to a schedule.

## The schedule object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"skd_HJ-awlxZ6M",
  "createdAt":"2018-04-27T18:48:04.614Z",
  "updatedAt":"2018-04-27T19:23:34.631Z",
  "repeat":0,
  "rules":[
    {
      "layer":1,
      "timeout":5
    },{
      "layer":2,
      "timeout":10
    },{
      "layer":3,
      "timeout":15
    }
  ],
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
repeat | number | Number of repetitions to repeat the escalation layers before dropping an incident.
rules | array | An array of objects comprised of `layer` and `timeout` (in minutes).

## Retrieve a schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/schedule/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"skd_HJ-awlxZ6M",
  "createdAt":"2018-04-27T18:48:04.614Z",
  "updatedAt":"2018-04-27T19:23:34.631Z",
  "repeat":0,
  "rules":[
    {
      "layer":1,
      "timeout":5
    },{
      "layer":2,
      "timeout":10
    },{
      "layer":3,
      "timeout":15
    }
  ],
}
```

### Definition

`GET https://api.pagertree.com/schedule/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule to retrieve

### Returns
Returns a schedule if a valid schedule `id` was provided. Returns [an error](#errors) otherwise.

## Update a schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"rules":[{"layer":1,"timeout":"6"},{"layer":2,"timeout":7},{"layer":3,"timeout":8}]}'\
  -X PUT \
  https://api.pagertree.com/schedule/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"skd_HJ-awlxZ6M",
  "createdAt":"2018-04-27T18:48:04.614Z",
  "updatedAt":"2018-04-27T19:23:34.631Z",
  "repeat":0,
  "rules":[
    {
      "layer":1,
      "timeout":6
    },{
      "layer":2,
      "timeout":7
    },{
      "layer":3,
      "timeout":8
    }
  ],
}
```

### Definition

`PUT https://api.pagertree.com/schedule/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule to update

See the [schedule object](#the-schedule-object) for all parameters.

### Returns
The newly updated schedule object if the request succeeded. Returns [an error](#errors) otherwise.

## List all current events for a schedule

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/schedule/:id/currentevents
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

`GET https://api.pagertree.com/schedule/:id/currentevents`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the schedule to get current events for

### Returns
An array of any events in which the schedule is currently on-call. Each item in the array is a event object.
