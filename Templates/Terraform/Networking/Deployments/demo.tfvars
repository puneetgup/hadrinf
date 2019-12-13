SharedServicesResourceGroupLocation                 = "WestUS"
SharedServices-VNet-AddressSpace                    = "10.0.0.0/16"
SharedServices-GatewaySubnet-AddressPrefix          = "10.0.1.0/27"
SharedServices-DomainControllerSubnet-AddressPrefix = "10.0.2.0/24"


Prod-ResourceGroupLocation    = "EastUS"
Prod-VNet-AddressSpace        = "192.168.0.0/16"
Prod-WebSubnet-AddressPrefix  = "192.168.1.0/24"
Prod-AppSubnet-AddressPrefix  = "192.168.2.0/24"
Prod-DataSubnet-AddressPrefix = "192.168.3.0/24"


NonProd-ResourceGroupLocation    = "CentralUS"
NonProd-VNet-AddressSpace        = "172.16.0.0/16"
NonProd-WebSubnet-AddressPrefix  = "172.16.1.0/24"
NonProd-AppSubnet-AddressPrefix  = "172.16.2.0/24"
NonProd-DataSubnet-AddressPrefix = "172.16.3.0/24"


HubVNet-AllowVNetAccess       = true
HubVNet-AllowForwardedTraffic = true
HubVNet-AllowGatewayTransit   = true

ProdVNet-AllowVNetAccess       = true
ProdVNet-AllowForwardedTraffic = true
ProdVNet-AllowGatewayTransit   = false

NonProdVNet-AllowVNetAccess       = true
NonProdVNet-AllowForwardedTraffic = true
NonProdVNet-AllowGatewayTransit   = false

Hub-ERGateway-ActiveActiveEnabled = false
Hub-ERGateway-BGPEnabled          = true
Hub-ERGateway-SKU                 = "Standard"