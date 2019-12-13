resource "azurerm_public_ip" "Hub-ERGateway-PublicIP" {
  name                = "Hub-ERGW-PIP"
  location            = azurerm_resource_group.SharedServicesRG.location
  resource_group_name = azurerm_resource_group.SharedServicesRG.name
  allocation_method   = "Dynamic"
}

// resource "azurerm_virtual_network_gateway" "Hub-ERGateway" {
//   name                = "Hub-ERGW"
//   location            = azurerm_resource_group.SharedServicesRG.location
//   resource_group_name = azurerm_resource_group.SharedServicesRG.name
//   type     = "ExpressRoute"
//   vpn_type = "RouteBased"
//   active_active = var.Hub-ERGateway-ActiveActiveEnabled
//   enable_bgp    = var.Hub-ERGateway-BGPEnabled
//   sku           = var.Hub-ERGateway-SKU
//   ip_configuration {
//     name                          = "Hub-ERGW-IPConfig"
//     public_ip_address_id          = azurerm_public_ip.Hub-ERGateway-PublicIP.id
//     private_ip_address_allocation = "Dynamic"
//     subnet_id                     = azurerm_subnet.GatewaySubnet.id
//   }
//   depends_on = [azurerm_virtual_network.SharedServicesVNET, azurerm_public_ip.Hub-ERGateway-PublicIP]
// }