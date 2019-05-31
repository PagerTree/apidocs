# Account
An account represents your company organization.

## The account object
Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
active | boolean | Does the account have an active subscript (active or trialing).
name | string | The name of the account.
token_id | string | The unique identifier of the token to use for invites to join the account.
hipaanotifications | boolean | Are HIPAA notification enabled?
stripe_customer_id | string | The Stripe customer id
stripe_subscription | object | The Stripe subscription object.
stripe_customer | object | The Stripe customer object.

## Retrieve an account

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/account/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "acc_H1fh_yx6z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "name": "PagerTree LLC",
  "setup_complete": 1524787386,
  "token_id": "tkn_ByGE2ukxpf",
  "hipaanotifications": false,
  "active": true,
  "stripe_customer_id": "cus_CkpiEkrJ40EIJd",
  "stripe_customer": {...},
  "stripe_subscription": {...}
}
```

### Definition

`GET https://api.pagertree.com/account/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the account to retrieve

## Update an account

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"hipaanotifications": true}'\
  -X PUT \
  https://api.pagertree.com/account/:id
```

> The above command returns JSON structured like this:

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "acc_H1fh_yx6z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "name": "PagerTree LLC",
  "setup_complete": 1524787386,
  "token_id": "tkn_ByGE2ukxpf",
  "hipaanotifications": true,
  "active": true,
  "stripe_customer_id": "cus_CkpiEkrJ40EIJd",
  "stripe_customer": {...},
  "stripe_subscription": {...}
}
```

### Definition

`PUT https://api.pagertree.com/account/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the account to update

See the [account object](#the-account-object) for all parameters.

### Returns
The newly updated user object if the request succeeded. Returns [an error](#errors) otherwise.
