# Private DNS Zones `[Microsoft.Network/privateDnsZones]`

This template deploys a private DNS zone.

## Resource types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/locks` | 2017-04-01 |
| `Microsoft.Authorization/roleAssignments` | 2021-04-01-preview |
| `Microsoft.Network/privateDnsZones` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/A` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/AAAA` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/CNAME` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/MX` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/PTR` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/SOA` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/SRV` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/TXT` | 2020-06-01 |
| `Microsoft.Network/privateDnsZones/virtualNetworkLinks` | 2020-06-01 |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `a` | _[A](A/readme.md)_ array | `[]` |  | Optional. Array of A records. |
| `aaaa` | _[AAAA](AAAA/readme.md)_ array | `[]` |  | Optional. Array of AAAA records. |
| `cname` | _[CNAME](CNAME/readme.md)_ array | `[]` |  | Optional. Array of CNAME records. |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `location` | string | `global` |  | Optional. The location of the PrivateDNSZone. Should be global. |
| `lock` | string | `NotSpecified` | `[CanNotDelete, NotSpecified, ReadOnly]` | Optional. Specify the type of lock. |
| `mx` | _[MX](MX/readme.md)_ array | `[]` |  | Optional. Array of MX records. |
| `name` | string |  |  | Required. Private DNS zone name. |
| `ptr` | _[PTR](PTR/readme.md)_ array | `[]` |  | Optional. Array of PTR records. |
| `roleAssignments` | array | `[]` |  | Optional. Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11' |
| `soa` | _[SOA](SOA/readme.md)_ array | `[]` |  | Optional. Array of SOA records. |
| `srv` | _[SRV](SRV/readme.md)_ array | `[]` |  | Optional. Array of SRV records. |
| `tags` | object | `{object}` |  | Optional. Tags of the resource. |
| `txt` | _[TXT](TXT/readme.md)_ array | `[]` |  | Optional. Array of TXT records. |
| `virtualNetworkLinks` | _[virtualNetworkLinks](virtualNetworkLinks/readme.md)_ array | `[]` |  | Optional. Array of custom objects describing vNet links of the DNS zone. Each object should contain properties 'vnetResourceId' and 'registrationEnabled'. The 'vnetResourceId' is a resource ID of a vNet to link, 'registrationEnabled' (bool) enables automatic DNS registration in the zone for the linked vNet. |

### Parameter Usage: `roleAssignments`

```json
"roleAssignments": {
    "value": [
        {
            "roleDefinitionIdOrName": "Reader",
            "principalIds": [
                "12345678-1234-1234-1234-123456789012", // object 1
                "78945612-1234-1234-1234-123456789012" // object 2
            ]
        },
        {
            "roleDefinitionIdOrName": "/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11",
            "principalIds": [
                "12345678-1234-1234-1234-123456789012" // object 1
            ]
        }
    ]
}
```

### Parameter Usage: `tags`

Tag names and tag values can be provided as needed. A tag can be left without a value.

```json
"tags": {
    "value": {
        "Environment": "Non-Prod",
        "Contact": "test.user@testcompany.com",
        "PurchaseOrder": "1234",
        "CostCenter": "7890",
        "ServiceName": "DeploymentValidation",
        "Role": "DeploymentValidation"
    }
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the private DNS zone |
| `resourceGroupName` | string | The resource group the private DNS zone was deployed into |
| `resourceId` | string | The resource ID of the private DNS zone |

## Template references

- [Locks](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2017-04-01/locks)
- [Privatednszones](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones)
- [Privatednszones/A](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/A)
- [Privatednszones/AAAA](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/AAAA)
- [Privatednszones/CNAME](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/CNAME)
- [Privatednszones/MX](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/MX)
- [Privatednszones/PTR](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/PTR)
- [Privatednszones/SOA](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/SOA)
- [Privatednszones/SRV](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/SRV)
- [Privatednszones/TXT](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/TXT)
- [Privatednszones/Virtualnetworklinks](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/2020-06-01/privateDnsZones/virtualNetworkLinks)
- [Roleassignments](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Authorization/roleAssignments)
