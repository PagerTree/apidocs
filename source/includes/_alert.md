# Alert

An alert represents an urgent notice (state of alarm). It can also represent a broadcast, page, or stakeholder notice.

> Alert Object

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"alt_HJ3eGW-6M",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "parent_id": "alt_xxxxxxxx",
  "thirdparty_id": "abc-123",
  "destination_ids": ["tem_xxxxxxxxx", "usr_yyyyyyyy", "rtr_zzzzzzzz"],
  "title":"CPU usage over 95%",
  "description":"PROD APP 1 CPU load over 95% for 5 minutes.",
  "type": "alert",
  "subtype": "alert",
  "status":"resolved",
  "urgency":"critical",
  "d_team_id":"tem_ByxQ3ukgTM",
  "d_user_id":"usr_r1mnuJg6z",
  "s_log_id": "log_xxxxxxxxx",

  "created":1524859374,
  "acknowledged":1524859483,
  "acknowledgedby": "usr_xxxxxxxx",
  "resolved":1524859487,
  "resolvedby": "usr_xxxxxxxx",
  "archived": 1524859488,
  "archivedby": "usr_xxxxxxxx",

  "livecall": "QU_XXXX",

  "source_id": "usr_r1mnuJg6z",
  
  "response_requested": false,
  "responses": ["Yes", "No", ...],
  "responses_recorded": {
    "usr_xxxxxxx": {
      "user_id": "usr_xxxxxxx",
      "value": 1,
      "recorded": 1524859488
    }
    ...
  },
  
  "tags": ["a", "tag"],
  "additional_data": [{
    "type": "text",
    "label": "Subject",
    "value": "Hello this is a subject"
  }, ...],

  "stakeholder_ids": ["stk_xxxxxxxxx", ...],
  "handoffs": [{
    "to": "usr_xxxxxxx",
    "from": "usr_yyyyyyy",
    "time": 1524859488,
    "acknowledged": 1524859488
  }, ...],
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
parent_id | string | Parent alert id (optional).
thirdparty_id | string | A unique string mapping this to a third party system.
destination_ids | array | An array containing the destinations the alert should be routed to.
title | string | The title of the alert.
description | string | The description of the alert.
type | string | The type of alert.
subtype | string | The subtype of the alert.
status | string | The status of the alert.
urgency | string | The urgency of the alert.
d_team_id | string | The id of the team this alert has been assigned to.
d_user_id | string | The id of the user this alert has been assigned to.
s_log_id | string | The id of the integration log that created this alert.
created | number | The unix timestamp this alert was created.
acknowledged | number | The unix timestamp this alert was acknowledged.
acknowledgedby | string | The id of the user this alert was acknowledged by.
resolved | number | The unix timestamp this alert was resolved.
resolvedby | string | The id of the user or integration this alert was resolved by.
archived | number | The unix timestamp this alert was archived.
archivedby | string | The id of the user this alert was archived by.
livecall | string | The Twilio Queue Id of the waiting call.
source_id | string | The id of the user or integration that created this alert..
response_requested | boolean | For broadcasts, flag indicating if a response was requested.
responses | array | Array of strings with response values.
responses_recorded | object | An object containing responses of a broadcast.
tags | array | An array of strings. Each string represents a tag.
additional_data | array | An array of objects containing additional data from an integration.
stakeholder_ids | array | An array of strings. Each a stakeholder id.
handoffs | array | An array of objects containing information regarding handoffs.

#### Notes
- Set the `meta.incident` to true to flag this as an incident.
- Set the `meta.incident_severity` to set the severity. (SEV-1|SEV-2|SEV-3|SEV-4|SEV-5)
- Set the `meta.incident_message` to set the special incident message.

## Create an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"title":"Hello World","destination_ids: ["tem_xxxxxxxx"]"}'\
  https://api.pagertree.com/alert
```

### Definition

`POST https://api.pagertree.com/alert`

### Body Parameters

Parameter | Description
--------- | -----------
title | The title of the alert.
destination_ids | An array of ids (user/team/schedule) to route the alert to.

See the [alert object](#alert) for optional parameters.

### Returns

The newly created [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/alert/:id
```

### Definition

`GET https://api.pagertree.com/alert/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to retrieve

### Returns
Returns the [alert object](#alert) if a valid alert `id` was provided. Returns [an error](#errors) otherwise.

## Update an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"description": "Cool, that got updated"}'\
  -X PUT \
  https://api.pagertree.com/alert/:id
```

### Definition

`PUT https://api.pagertree.com/alert/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to update

### Body Parameters

See the [alert object](#alert) for all parameters.

### Returns
The newly updated [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/alert/:id
```

### Definition

`DELETE https://api.pagertree.com/alert/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

## List all Alerts

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
A paginated response with a `data` array property. Each item in the array is an [alert object](#alert).

## Acknowledge an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X POST \
  https://api.pagertree.com/alert/:id/acknowledge
```

### Definition

`POST https://api.pagertree.com/alert/:id/acknowledge`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to acknowledge

### Returns
The newly updated [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

#### Notes
The alert must be in the `open` or `dropped` status to be acknowledged. The credentials being used will be the acknowledging user.

## Reject an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X POST \
  https://api.pagertree.com/alert/:id/reject
```

### Definition

`POST https://api.pagertree.com/alert/:id/reject`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to reject

### Returns
The newly updated [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

#### Notes
The alert must be in the `open` status and the user making the call must have an open notification workflow for this alert in order to be rejected. The credentials being used will be the rejecting user.

## Resolve an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X POST \
  https://api.pagertree.com/alert/:id/resolve
```

### Definition

`POST https://api.pagertree.com/alert/:id/resolve`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to resolve

### Returns
The newly updated [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

#### Notes
The alert must be in the `acknowledged` status to be resolved. The credentials being used will be the resolving user.

## Archive an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X POST \
  https://api.pagertree.com/alert/:id/archive
```

### Definition

`POST https://api.pagertree.com/alert/:id/archive`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to archive

### Returns
The newly updated [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

#### Notes
The alert must be in the `resolved` or `dropped` status to be archived. The credentials being used will be the archiving user.

## Handoff an Alert

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"to":"tem_xxxxxxxx"}'\
  https://api.pagertree.com/alert/:id/handoff
```

### Definition

`POST https://api.pagertree.com/alert/:id/handoff`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the alert to handoff

### Body Parameters

Parameter | Description
--------- | -----------
to | The id of the user or team to handoff the alert to.

### Returns
The newly updated [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.
