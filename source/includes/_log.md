# Log

A log represents a message that must be sent to the user.

## The log object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"log_ByFxMWWpM",
  "createdAt":"2018-04-27T20:02:57.110Z",
  "owner_id":"inc_H1DxGWbpG",
  "content":"Created by usr_r1mnuJg6z"
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
owner_id | string | The resource that owns this log.
source_id | string | The resource that created this log.
content | string | A message or data.

## Create a log

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"owner_id":"inc_H1DxGWbpG","source_id":"usr_r1mnuJg6z","content":"Working on a resolution now."}'\
  https://api.pagertree.com/log
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"log_Skrc0zbaG",
  "createdAt":"2018-04-27T22:05:00.610Z",
  "owner_id":"inc_H1DxGWbpG",
  "source_id":"usr_r1mnuJg6z",
  "content":"Working on a resolution now."
}
```

### Definition

`POST https://api.pagertree.com/log`

### Body Parameters

Parameter | Description
--------- | -----------
owner_id | The resource that owns this log.
content | A message or data.

See the [user object](#the-user-object) for optional parameters.

### Returns

The newly created user object if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a log

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/log/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"log_Skrc0zbaG",
  "createdAt":"2018-04-27T22:05:00.610Z",
  "owner_id":"inc_H1DxGWbpG",
  "source_id":"usr_r1mnuJg6z",
  "content":"Working on a resolution now."
}
```

### Definition

`GET https://api.pagertree.com/log/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the log to retrieve

### Returns
Returns a log if a valid log `id` was provided. Returns [an error](#errors) otherwise.

## List all logs

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/log
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

`GET https://api.pagertree.com/log`

### Returns
A paginated response with a `data` array property. Each item in the array is a log object.
