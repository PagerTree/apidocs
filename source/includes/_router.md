# Router

Routers are objects that can dynamically route alerts and notifications based on conditions.

> Router Object

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"rtr_HJ3eGW-6M",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "tinyId": 1,
  "name": "Critical Alert Routing Rules",
  "enabled": true,
  "type": "router",
  "default_receiver": "tem_xxxxxxxx",
  "rules": "
      ---
      rules:
        - match:
            alert.urgency:
              \"$in\":
              - critical
          actions:     
          - type: assign
            receiver: tem_yyyyyyyy
    "
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
name | string | Friendly name for the router.
enabled | boolean | Flag indicating if the router is enabled.
type | string | The type of router. Can be "router" or "notification".
default_receiver | string | Id of the default receiver if no rules match. Only applicable to `router` type.
settings | string | YAML definition or the router. See [docs](https://pagertree.com/knowledge-base/routers/).

## Create an Router

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name":"Critical Alert Routing Rules","settings: "--- yaml...", "type": "router", "default_receiver": "tem_xxxxxxxx"}'\
  https://api.pagertree.com/router
```

### Definition

`POST https://api.pagertree.com/router`

### Body Parameters

Parameter | Description
--------- | -----------
name | Friendly name for the router
settings | YAML definition for the router
type | The router type
default_receiver | The default receiver for this router

See the [router object](#router) for optional parameters.

### Returns

The newly created [router object](#router) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve an Router

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/router/:id
```

### Definition

`GET https://api.pagertree.com/router/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the router to retrieve

### Returns
Returns the [router object](#router) if a valid router `id` was provided. Returns [an error](#errors) otherwise.

## Update an Router

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"enabled": false}'\
  -X PUT \
  https://api.pagertree.com/router/:id
```

### Definition

`PUT https://api.pagertree.com/router/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the router to update

### Body Parameters

See the [router object](#router) for all parameters.

### Returns
The newly updated [router object](#router) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete an Router

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/router/:id
```

### Definition

`DELETE https://api.pagertree.com/router/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the router to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

#### Notes
This could have unintended consequences if referenced by [users](#users) or [integrations](#integration).

## List all Routers

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/router
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

`GET https://api.pagertree.com/router`

### Returns
A paginated response with a `data` array property. Each item in the array is an [router object](#router).

## Get Router Default Template

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/router/default-template/:type
```

### Definition

`GET https://api.pagertree.com/router/default-template/:type`

### URL Parameters

Parameter | Description
--------- | -----------
type | String - `router` or `notification`

### Returns
The default template string. Returns [an error](#errors) otherwise.
