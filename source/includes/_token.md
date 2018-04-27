# Token

A token is a security feature that allows anonymous access to resources.

## The token object

> Example Response

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"tkn_ByGE2ukxpf",
  "createdAt":"2018-04-27T00:02:51.863Z",
  "resource_id":"acc_H1fh_yx6z",
  "sequence":"17475d2c-eed3-44ee-9c82-db594721d303"
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
resource_id | string | The resource access has been granted to.
sequence | string | A UUID that grants the access.

## Retrieve a token

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/token/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid":"acc_H1fh_yx6z",
  "id":"tkn_ByGE2ukxpf",
  "createdAt":"2018-04-27T00:02:51.863Z",
  "resource_id":"acc_H1fh_yx6z",
  "sequence":"17475d2c-eed3-44ee-9c82-db594721d303"
}
```

### Definition

`GET https://api.pagertree.com/token/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the token to retrieve

### Returns
Returns a token if a valid token `id` was provided. Returns [an error](#errors) otherwise.
