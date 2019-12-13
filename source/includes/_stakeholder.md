# Stakeholder

Stakeholders are groups of people who have interest in alerts, but might not necessarily need to be in an on-call rotation. Stakeholders could be executives, product managers, or anyone who might be impacted by an alert in question.

> Stakeholder Object

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"stk_HJ3eGW-6M",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "name": "Business Execs",
  "enabled": true,
  "user_ids": ["usr_xxxxxxxx", "usr_yyyyyyy"],
  "emails": ["amiller@pagertree.com"],
  "events": {
    "alert_assigned": false,
    "alert_acknowledged": true,
    "alert_resolved": true,
    "alert_dropped": true,
  }
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
name | string | Friendly name for the stakeholder.
enabled | boolean | Flag indicating if the stakeholder is enabled.
user_ids | array | Array of string user ids that belong to the stakeholder group.
emails | array | Array of string email addresses that belong to the stakeholder group.
events | object | Object with flags of applicable events

## Create a Stakeholder

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name":"Business Execs","user_ids: ["usr_xxxxxx"]}'\
  https://api.pagertree.com/stakeholder
```

### Definition

`POST https://api.pagertree.com/stakeholder`

### Body Parameters

Parameter | Description
--------- | -----------
name | Friendly name for the stakeholder
user_ids | Users belonging to the stakeholder group

See the [stakeholder object](#stakeholder) for optional parameters.

### Returns

The newly created [stakeholder object](#stakeholder) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a Stakeholder

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/stakeholder/:id
```

### Definition

`GET https://api.pagertree.com/stakeholder/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the stakeholder to retrieve

### Returns
Returns the [stakeholder object](#stakeholder) if a valid stakeholder `id` was provided. Returns [an error](#errors) otherwise.

## Update a Stakeholder

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"enabled": false}'\
  -X PUT \
  https://api.pagertree.com/stakeholder/:id
```

### Definition

`PUT https://api.pagertree.com/stakeholder/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the stakeholder to update

### Body Parameters

See the [stakeholder object](#stakeholder) for all parameters.

### Returns
The newly updated [stakeholder object](#stakeholder) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a Stakeholder

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/stakeholder/:id
```

### Definition

`DELETE https://api.pagertree.com/stakeholder/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the stakeholder to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

#### Notes
This could have unintended consequences if references by [teams](#team) or [routers](#router).

## List all Stakeholders

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/stakeholder
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

`GET https://api.pagertree.com/stakeholder`

### Returns
A paginated response with a `data` array property. Each item in the array is an [stakeholder object](#stakeholder).
