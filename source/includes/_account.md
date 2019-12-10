# Account
An account represents your company organization.

> Account Object

```json
{
  "sid": "acc_H1fh_yx6z",
  "id": "acc_H1fh_yx6z",
  "createdAt": "2018-04-27T00:02:50.419Z",
  "updatedAt": "2018-04-27T00:03:06.098Z",
  "meta": {
    "key": "value",
    ...
  },
  "name": "PagerTree LLC",
  "token_id": "tkn_ByGE2ukxpf",
  "stripe": {
    "customer": {...},
    "subscription": {...}
  },
  "sso": {...},
  "notification_templates": {
    "alert_acknowledged": {
      "push": {
        "subject": "",
        "message": "",
      },
      "email": {
        "subject": "",
        "message": "",
      },
      "sms": {
        "message": ""
      },
      "voice": {
        "message": ""
      }
    },
    "alert_alert": {...},
    "alert_broadcast": {...},
    "alert_dropped": {...},
    "alert_handoff": {...},
    "alert_page": {...},
    "alert_rejected": {...},
    "alert_stakeholder": {...},
    "alert_timeout": {...},
    "event_goc": {...}
  }
}
```

Parameter | Type | Description
--------- | ---- | -----------
sid | string | Security identifier for the object.
id | string | Unique identifier for the object.
createdAt | timestamp | When this object was first created.
updatedAt | timestamp | When this object last updated.
meta | object | Free form metadata.
name | string | The name of the account.
token_id | string | The unique identifier of the token to use for invites to join the account.
stripe | object | The Stripe customer / subscription.
sso | object | Single Sign On settings.
notification_templates | object | Notification templates for the different notification .type_subtype

## Retrieve an account

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  https://api.pagertree.com/account/:id
```

### Definition

`GET https://api.pagertree.com/account/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the account to retrieve

### Returns
The newly created [account object](#account)  if the request succeeded. Returns [an error](#errors) otherwise.


## Update an account

> Example Request

```shell
curl -H "Content-Type: application/json" \
  -H "Authorization: <token>" \
  -d '{"name": "My new company name"}'\
  -X PUT \
  https://api.pagertree.com/account/:id
```

### Definition

`PUT https://api.pagertree.com/account/:id`

### URL Parameters

Parameter | Description
--------- | -----------
id | The id of the account to update

See the [account object](#account) for all parameters.

### Returns
The newly updated [account object](#account) if the request succeeded. Returns [an error](#errors) otherwise.
