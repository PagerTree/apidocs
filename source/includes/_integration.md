# Integration

An integration connects PagerTree to 3rd party applications.

> Integration Object

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"int_HJ3eGW-6M",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "name":"Devops Email",
  "type":"email",
  "enabled":true,
  "urgency": "high",
  "destination_ids":["tem_ByxQ3ukgTM"],
  "options":{...},
  
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
name | The name of the integration.
type | The type of the integration.
enabled | Flag indicating if the integration is currently enabled
urgency | Default urgency of alerts created by this integration
destination_ids | Array of destinations to route alerts created by this integration. Can be team, router, user, or schedule ids.
options | Integration specific options

## Create an Integration

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name":"Email Integration", "type": "email", "destination_ids": ["tem_xxxxxxx"]}'\
  https://api.pagertree.com/integration
```

### Definition

`POST https://api.pagertree.com/integration`

### Body Parameters

Parameter | Description
--------- | -----------
name | Friendly name for the integration
type | The integration type
destination_ids | The destinations to route alerts to when created by this integration

See the [integration object](#integration) for optional parameters.

### Returns

The newly created [integration object](#integration) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve an Integration

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/integration/:id
```

### Definition

`GET https://api.pagertree.com/integration/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the integration to retrieve

### Returns
Returns the [integration object](#integration) if a valid integration `id` was provided. Returns [an error](#errors) otherwise.

## Update an Integration

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"enabled": false}'\
  -X PUT \
  https://api.pagertree.com/integration/:id
```

### Definition

`PUT https://api.pagertree.com/integration/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the integration to update

### Body Parameters

See the [integration object](#integration) for all parameters.

### Returns
The newly updated [integration object](#integration) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete an Integration

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/integration/:id
```

### Definition

`DELETE https://api.pagertree.com/integration/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the integration to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

#### Notes
This could have unintended consequences if references by 3rd party systems.

## List all Integrations

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/integration
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

`GET https://api.pagertree.com/integration`

### Returns
A paginated response with a `data` array property. Each item in the array is an [integration object](#integration).
