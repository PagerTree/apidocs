# Broadcast

A broadcast is mass alert that can be sent to users.

## The broadcast object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "message":"SEV 1 security infiltration. All hands on deck!",
  "source_id":"usr_r1mnuJg6z",
  "user_ids":["usr_t2fJunzAk"],
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
message | string | The message to be sent.
source_id | string | The source user id that created the broadcast.
user_ids | array | An array of user ids that the broadcast will send to.

## Create a broadcast

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"message":"SEV 1 security infiltration. All hands on deck!","source_id":"usr_r1mnuJg6z","user_ids":["usr_r1mnuJg6z"]}'\
  https://api.pagertree.com/broadcast
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"brd_H1NCdG-TM",
  "createdAt":"2018-04-27T21:40:28.469Z",
  "message":"SEV 1 security infiltration. All hands on deck!",
  "source_id":"usr_r1mnuJg6z",
  "user_ids":["usr_r1mnuJg6z"]
}
```

### Definition

`POST https://api.pagertree.com/broadcast`

### Body Parameters

Parameter | Description
--------- | -----------
message | The message to be sent.
source_id | The source user id that created the broadcast.
user_ids | An array of user ids that the broadcast will send to.

### Returns

The newly created broadcast object if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a broadcast

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/broadcast/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"brd_H1NCdG-TM",
  "createdAt":"2018-04-27T21:40:28.469Z",
  "message":"SEV 1 security infiltration. All hands on deck!",
  "source_id":"usr_r1mnuJg6z",
  "user_ids":["usr_r1mnuJg6z"]
}
```

### Definition

`GET https://api.pagertree.com/broadcast/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the broadcast to retrieve

### Returns
Returns a broadcast if a valid broadcast `id` was provided. Returns [an error](#errors) otherwise.

## List all broadcasts

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/broadcast
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

`GET https://api.pagertree.com/broadcast`

### Returns
A paginated response with a `data` array property. Each item in the array is a broadcast object.
