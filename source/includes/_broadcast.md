# Broadcast

A broadcast is mass alert that can be sent to users and teams. Please use the [alert](#alert) api as these endpoints are DEPRECATED and only provided as convinience. It's possible they be removed at any time.

## The Broadcast object

See the [alert](#alert) object for details.

## Create a Broadcast

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"title":"All hands on deck","destination_ids: ["tem_xxxxxxxx"]"}'\
  https://api.pagertree.com/broadcast
```

### Definition

`POST https://api.pagertree.com/broadcast`

### Body Parameters

Parameter | Description
--------- | -----------
title | The title of the broadcast.
destination_ids | An array of ids (user/team) to route the broadcast to.

See the [alert object](#alert) for optional parameters.

### Returns

The newly created [alert object](#alert) if the request succeeded. Returns [an error](#errors) otherwise.

## Retrieve a Broadcast

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/broadcast/:id
```

### Definition

`GET https://api.pagertree.com/broadcast/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the broadcast to retrieve

### Returns
Returns the [alert object](#alert) if a valid broadcast `id` was provided. Returns [an error](#errors) otherwise.

## Delete a Broadcast

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -X DELETE \
  https://api.pagertree.com/broadcast/:id
```

### Definition

`DELETE https://api.pagertree.com/broadcast/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the broadcast to delete


### Returns

A `204 - NO CONTENT` on success or `404 - NOT FOUND` on failure.

## List all Broadcasts

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/broadcast
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

`GET https://api.pagertree.com/broadcast`

### Returns
A paginated response with a `data` array property. Each item in the array is an [alert object](#alert).

