# Integration

A integration connects PagerTree to 3rd party applications.

## The integration object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"int_Skbm3OJe6f",
  "createdAt":"2018-04-27T00:02:51.011Z",
  "updatedAt":"2018-04-27T19:38:47.220Z",
  "name":"Devops Email",
  "type":"email",
  "d_team_id":"tem_ByxQ3ukgTM",
  "urgency":"medium",
  "enabled":true
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
name | string | The name of the integration.
type | string | The type of the integration.
d_team_id | string | The destination team id for any incident created from this integration.
urgency | string | The urgency of the incident to be created.
enabled | boolean | If enabled the integration will create incidents, if not it will ignore incoming requests.

## Create a integration

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"sid":"acc_H1fh_yx6z","enabled":true,"name":"Apex Ping Integration","type":"apexping","urgency":"critical","d_team_id":"tem_ByxQ3ukgTM"}'\
  https://api.pagertree.com/integration
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"int_BJOG0gZpz",
  "createdAt":"2018-04-27T19:46:24.394Z",
  "name":"Apex Ping Integration",
  "type":"apexping",
  "urgency":"critical",
  "d_team_id":"tem_ByxQ3ukgTM",
  "enabled": true
}
```

### Definition

`POST https://api.pagertree.com/integration`

### Body Parameters

Parameter | Description
--------- | -----------
name | The name of the integration.
type | The type of the integration.
d_team_id | The destination team id for any incident created from this integration.

See the [integration object](#the-integration-object) for optional parameters.

### Returns

The newly created integration object if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a integration

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/integration/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"int_BJOG0gZpz",
  "createdAt":"2018-04-27T19:46:24.394Z",
  "updatedAt":"2018-04-27T19:50:29.785Z",
  "name":"Apex Ping Integration",
  "type":"apexping",
  "urgency":"critical",
  "d_team_id":"tem_ByxQ3ukgTM",
  "enabled": true
}
```

### Definition

`GET https://api.pagertree.com/integration/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the integration to retrieve

### Returns
Returns a integration if a valid integration `id` was provided. Returns [an error](#errors) otherwise.

## Update a integration

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"enabled": "false"}'\
  -X PUT \
  https://api.pagertree.com/integration/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"int_BJOG0gZpz",
  "createdAt":"2018-04-27T19:46:24.394Z",
  "updatedAt":"2018-04-27T19:50:29.785Z",
  "name":"Apex Ping Integration",
  "type":"apexping",
  "urgency":"critical",
  "d_team_id":"tem_ByxQ3ukgTM",
  "enabled": false
}
```

### Definition

`PUT https://api.pagertree.com/integration/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the integration to update

See the [integration object](#the-integration-object) for all parameters.

### Returns
The newly updated integration object if the request succeeded. Returns [an error](#errors) otherwise.

## Delete a integration

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

## List all integrations

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
A paginated response with a `data` array property. Each item in the array is a integration object.
