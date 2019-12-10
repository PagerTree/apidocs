# Automation

An automation is an HTTP request that can be made to thirdparty systems. Automations must be used with routes. They can dynamically run when alerts matching certain conditions are met. Think "reboot server when alert title contains '504 Gateway Timeout'".

> Automation Object

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
  "tinyId": 1,
  "name": "Reboot App Servers",
  "enabled": true,
  "settings": "
      ---
      # url (required)
      url: https://your.url
      # method (required)
      method: get

      # custom headers for your request (optional)
      # headers:
        # x-custom-header-1: x-custom-value-1
        # x-custom-header-2: x-custom-value-2

      # url parameters to be sent with the request (optional)
      # params:
        # param-name-1: param-value-1
        # param-name-2: param-value-2

      # data sent in request body (optional)
      # data:
        # data-name-1: data-value-1
        # data-name-2: data-value-2

      # basic authorization credentials (optional)
      # auth:
        # username: janedoe
        # password: s00pers3cret
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
name | string | Friendly name for the automation.
enabled | boolean | Flag indicating if the automation is enabled.
settings | string | YAML definition for the HTTP request.

## Create an Automation

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name":"Reboot Servers","settings: "--- yaml..."}'\
  https://api.pagertree.com/automation
```

### Definition

`POST https://api.pagertree.com/automation`

### Body Parameters

Parameter | Description
--------- | -----------
name | Friendly name for the automation
settings | YAML defination for the HTTP request

See the [automation object](#automation) for optional parameters.

### Returns

The newly created [automation object](#automation) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve an Automation

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/automation/:id
```

### Definition

`GET https://api.pagertree.com/automation/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the automation to retrieve

### Returns
Returns the [automation object](#automation) if a valid automation `id` was provided. Returns [an error](#errors) otherwise.

## Update an Automation

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"enabled": false}'\
  -X PUT \
  https://api.pagertree.com/automation/:id
```

### Definition

`PUT https://api.pagertree.com/automation/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the automation to update

### Body Parameters

See the [automation object](#automation) for all parameters.

### Returns
The newly updated [automation object](#automation) if the request succeeded. Returns [an error](#errors) otherwise.

## Delete an Automation

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/automation/:id
```

### Definition

`DELETE https://api.pagertree.com/automation/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the automation to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

#### Notes
This could have unintended consequences if references by [routers](#router).

## List all Automations

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/automation
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

`GET https://api.pagertree.com/automation`

### Returns
A paginated response with a `data` array property. Each item in the array is an [automation object](#automation).

## Run an Automation

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X POST \
  https://api.pagertree.com/automation/:id/run
```

### Definition

`POST https://api.pagertree.com/automation/:id/run`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the automation to run

### Returns
The [log object](#log) of the run if the request succeeded. Returns [an error](#errors) otherwise.
