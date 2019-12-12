# Notification

A notification represents a message that was sent to a user on a specific channel.

> Notification Object

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
  "thirdparty_id": "8f0f1099-bad3-4b70-b3f7-2b36f03e404e",
  "source_id": "alt_xxxxxxxx",
  "user_id": "usr_xxxxxxx",
  "group_id": "61659c96-7c96-4426-94ad-20ba6980530e",
  "workflow_id": "wkf_xxxxxxxxxx",
  "stakeholder_id": "stk_xxxxxxxxx",
  "channel":"sms",
  "provider": "twilio",
  "template": "alert.alert",
  "to": "+15303413302",
  "from": "+18175928301",
  "direction": "OUTGOING",
  "subject":"Alert #531 - CPU High",
  "message":"CPU usage over 95%",
  "cost": 0.0075,
  "status": "sent",
  "provider_status": "queued",
  "sent":1524859380,
  "delivered":1524859382,
  "err": []
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
thirdparty_id | string | Provider id for the notification
source_id | string | The source of this notification
user_id | string | The user this notification was routed to
group_id | string | The group identifier for similar notifications
worfklow_id | string | The workflow id that this notification belongs to
stakeholder_id | string | The stakeholder id that this notification belongs to
channel | string | The channel of this notification (push, email, sms, voice, slack)
provider | string | The provider that sent this notification
template | string | The template that was used for this notification
to | string | The to address this notification was sent to
from | string | The from address this notification was sent from
direction | string | `INCOMING` or `OUTGOING`
subject | string | The subject of the notification
message | string | The message of the notification
cost | number | The amount this notification cost
status | string | PagerTree status of the notification
provider_status | string | Provider status of the notification
sent | number | Unix timestamp of when PagerTree sent the notification
delivered | number | Unix timestamp of when the provider reported the notification delivered
err | array | Array of strings describing errors

## Retrieve a Notification

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/notification/:id
```

### Definition

`GET https://api.pagertree.com/notification/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the notification to retrieve

### Returns
Returns the [notification object](#notification) if a valid notification `id` was provided. Returns [an error](#errors) otherwise.

## List all Notifications

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/notification
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

`GET https://api.pagertree.com/notification`

### Returns
A paginated response with a `data` array property. Each item in the array is an [notification object](#notification).
