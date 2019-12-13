# Log

A log message associated with a resource.

> Log Object

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"log_HJ3eGW-6M",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "content":"Created by usr_r1mnuJg6z",
  "type": "log",
  "subtype": "OUTGOING",
  "owner_id":"alt_H1DxGWbpG",
  "source_id": "usr_xxxxxxx",
  "level": 2
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
content | string | A message or data.
type | string | The type of log
subtype | string | `INCOMING` or `OUTGOING`
owner_id | string | The resource that owns this log.
source_id | string | The resource that created this log.
level | number | The level of the log


## Create a Log

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"content":"Created by usr_r1mnuJg6z","owner_id: "alt_xxxxxxxx", "source_id": "usr_xxxxxxx"}'\
  https://api.pagertree.com/log
```

### Definition

`POST https://api.pagertree.com/log`

### Body Parameters

Parameter | Description
--------- | -----------
content | A message or data
owner_id | The resource that owns this log
source_id | Who or What created this log

See the [log object](#log) for optional parameters.

### Returns

The newly created [log object](#log) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a Log

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/log/:id
```

### Definition

`GET https://api.pagertree.com/log/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the log to retrieve

### Returns
Returns the [log object](#log) if a valid log `id` was provided. Returns [an error](#errors) otherwise.

## List all Logs

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
A paginated response with a `data` array property. Each item in the array is an [log object](#log).
