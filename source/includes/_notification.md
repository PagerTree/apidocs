# Notification

A notification represents a message that was sent to a user on a specific channel.

## The notification object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"ntf_BJTgzZZpf",
  "createdAt":"2018-04-27T20:03:00.736Z",
  "subject":"Incident inc_H1DxGWbpG",
  "message":"CPU usage over 95%\r\n",
  "channel":"push",
  "status":"sent",

  "alert_id":"alt_HJ3eGW-6M",
  "user_id":"usr_r1mnuJg6z",
  "from":"PagerTree Push Service",
  "to":"usr_r1mnuJg6z",
  "sent":1524859380,
  "thirdparty_id":"6187714295308613000",
  "repeated":false,
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
subject | string | The subject that will be used for Email and Push notifications.
message | string | The body of the messsage.
channel | string | The channel this notification was sent on.
status | string | The status of the notification.
alert_id | string | The alert that triggered this notification.
user_id | string | The user this alert was sent to.
to | string | The email, phone, slack user, or user id this notification was sent to.
from | string | The email, phone, slack bot, or service this notification was sent from.
sent | number | A unix timestamp of when the notification sent from PagerTree.
delivered | number | A unix timestamp of when the notification was delivered. (if supported)
repeated | boolean | For voice notifications, flag indicating if the notification has been repeated.

## Retrieve a notification

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/notification/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"ntf_BJTgzZZpf",
  "createdAt":"2018-04-27T20:03:00.736Z",
  "subject":"Incident inc_H1DxGWbpG",
  "message":"CPU usage over 95%\r\n",
  "channel":"push",
  "status":"sent",

  "alert_id":"alt_HJ3eGW-6M",
  "user_id":"usr_r1mnuJg6z",
  "from":"PagerTree Push Service",
  "to":"usr_r1mnuJg6z",
  "sent":1524859380,
  "thirdparty_id":"6187714295308613000",
  "repeated":false,
}
```

### Definition

`GET https://api.pagertree.com/notification/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the notification to retrieve

### Returns
Returns a notification if a valid notification `id` was provided. Returns [an error](#errors) otherwise.
