@description('Required. Private DNS zone name.')
param privateDnsZoneName string

@description('Required. The name of the A record.')
param name string

@description('Optional. The list of A records in the record set.')
param aRecords array = []

@description('Optional. The metadata attached to the record set.')
param metadata object = {}

@description('Optional. The TTL (time-to-live) of the records in the record set.')
param ttl int = 3600

@description('Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId '.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' existing = {
  name: privateDnsZoneName
}

resource A 'Microsoft.Network/privateDnsZones/A@2020-06-01' = {
  name: name
  parent: privateDnsZone
  properties: {
    aRecords: aRecords
    metadata: metadata
    ttl: ttl
  }
}

@description('The name of the deployed A record')
output name string = A.name

@description('The resource ID of the deployed A record')
output resourceId string = A.id

@description('The resource group of the deployed A record')
output resourceGroupName string = resourceGroup().name
