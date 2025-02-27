@description('Required. The name of the VPN connection.')
param name string

@description('Required. The name of the VPN gateway this VPN connection is associated with.')
param vpnGatewayName string

@description('Optional. The IPSec policies to be considered by this connection.')
param ipsecPolicies array = []

@description('Optional. The traffic selector policies to be considered by this connection.')
param trafficSelectorPolicies array = []

@description('Optional. List of all VPN site link connections to the gateway.')
param vpnLinkConnections array = []

@description('Optional. Routing configuration indicating the associated and propagated route tables for this connection.')
param routingConfiguration object = {}

@description('Optional. Enable policy-based traffic selectors.')
param usePolicyBasedTrafficSelectors bool = false

@description('Optional. Use local Azure IP to initiate connection.')
param useLocalAzureIpAddress bool = false

@description('Optional. Enable rate limiting.')
param enableRateLimiting bool = false

@description('Optional. Enable internet security.')
param enableInternetSecurity bool = false

@description('Optional. Enable BGP flag.')
param enableBgp bool = false

@description('Optional. Routing weight for VPN connection.')
param routingWeight int = 0

@description('Optional. Expected bandwidth in MBPS.')
param connectionBandwidth int = 10

@description('Optional. Gateway connection protocol.')
@allowed([
  'IKEv1'
  'IKEv2'
])
param vpnConnectionProtocolType string = 'IKEv2'

@description('Optional. SharedKey for the VPN connection.')
param sharedKey string = ''

@description('Optional. Reference to a VPN site to link to')
param remoteVpnSiteResourceId string = ''

@description('Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId '.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource vpnGateway 'Microsoft.Network/vpnGateways@2021-05-01' existing = {
  name: vpnGatewayName
}

resource vpnConnection 'Microsoft.Network/vpnGateways/vpnConnections@2021-05-01' = {
  name: name
  parent: vpnGateway
  properties: {
    connectionBandwidth: connectionBandwidth
    enableBgp: enableBgp
    enableInternetSecurity: enableInternetSecurity
    enableRateLimiting: enableRateLimiting
    ipsecPolicies: ipsecPolicies
    remoteVpnSite: !empty(remoteVpnSiteResourceId) ? {
      id: remoteVpnSiteResourceId
    } : null
    routingConfiguration: routingConfiguration
    routingWeight: routingWeight
    sharedKey: sharedKey
    trafficSelectorPolicies: trafficSelectorPolicies
    useLocalAzureIpAddress: useLocalAzureIpAddress
    usePolicyBasedTrafficSelectors: usePolicyBasedTrafficSelectors
    vpnConnectionProtocolType: vpnConnectionProtocolType
    vpnLinkConnections: vpnLinkConnections
  }
}

@description('The name of the VPN connection')
output name string = vpnConnection.name

@description('The resource ID of the VPN connection')
output resourceId string = vpnConnection.id

@description('The name of the resource group the VPN connection was deployed into')
output resourceGroupName string = resourceGroup().name
