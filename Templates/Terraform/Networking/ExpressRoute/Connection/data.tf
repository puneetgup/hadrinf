data "azurerm_express_route_circuit" "HubExpressRoute-ExpressRoute" {
    name                  = var.Hub-ExpressRouteCircuit-Name
    resource_group_name   = var.Hub-ExpressRouteCircuit-RGName
}

data "azurerm_virtual_network_gateway" "HubExpressRoute-Gateway" {
  name                = var.Hub-ERGateway-Name
  resource_group_name = var.Hub-ERGateway-RGName
}