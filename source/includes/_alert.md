# Alert

A alert represents a message that must be sent to the user.

## The alert object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"alt_HJ3eGW-6M",
  "createdAt":"2018-04-27T20:02:59.778Z",
  "source_id":"inc_H1DxGWbpG",
  "user_id":"usr_r1mnuJg6z",
  "channels":["push","email"],
  "type":"incident",
  "template":"notify",
  "data":["inc_H1DxGWbpG"]
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
source_id | string | The source that created this alert. Could be an incident, broadcast, user, or PagerTree self generated.
user_id | string | The id of the user that needs to be notified.
channels | array | An array of channels to notify this user on.
type | string | The type of alert.
template | string | The template to use.
data| array | An array of data ids, specific to the type and template.

## Retrieve a alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/alert/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"alt_HJ3eGW-6M",
  "createdAt":"2018-04-27T20:02:59.778Z",
  "source_id":"inc_H1DxGWbpG",
  "user_id":"usr_r1mnuJg6z",
  "channels":["push","email"],
  "type":"incident",
  "template":"notify",
  "data":["inc_H1DxGWbpG"]
}
```

### Definition

`GET https://api.pagertree.com/alert/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to retrieve

### Returns
Returns a alert if a valid alert `id` was provided. Returns [an error](#errors) otherwise.

## List all alerts

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/alert
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

`GET https://api.pagertree.com/alert`

### Returns
A paginated response with a `data` array property. Each item in the array is a alert object.

## List all notifications for an lert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/alert/:id/notifications
```

> The above command returns JSON structured like this:

```json
[
  "data": [
    {...},
    {...},
  ],
  "has_more": false,
  "total_count": 2
]
```

### Definition

`GET https://api.pagertree.com/alert/:id/notifications`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to get notifications for

### Returns
A paginated response with a `data` array property. Each item in the array is a notification object.
