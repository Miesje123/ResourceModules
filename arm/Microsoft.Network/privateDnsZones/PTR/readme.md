# Private DNS Zone PTR record `[Microsoft.Network/privateDnsZones/PTR]`

This module deploys a Private DNS Zone PTR record.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Network/privateDnsZones/PTR` | 2020-06-01 |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `metadata` | object | `{object}` |  | Optional. The metadata attached to the record set. |
| `name` | string |  |  | Required. The name of the PTR record. |
| `privateDnsZoneName` | string |  |  | Required. Private DNS zone name. |
| `ptrRecords` | array | `[]` |  | Optional. The list of PTR records in the record set. |
| `ttl` | int | `3600` |  | Optional. The TTL (time-to-live) of the records in the record set. |

### Parameter Usage: `ptrRecords`

```json
"ptrRecords": {
    "value": [
      {
        "ptrdname": "string"
      }
    ]
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the deployed PTR record |
| `resourceGroupName` | string | The resource group of the deployed PTR record |
| `resourceId` | string | The resource ID of the deployed PTR record |

## Template references

- [Privatednszones/PTR](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/PTR)
