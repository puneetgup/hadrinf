resource "azurerm_virtual_network_gateway_connection" "ExpressRouteConnection" {
  name                = "Hub-ExpressRouteCircuit-${var.HubExpressRoute-PeeringLocation}-Connection"
  location            = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.location
  resource_group_name = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.resource_group_name

  type                               = var.ConnectionType
  routing_weight                     = var.RouteWeight
  enable_bgp                         = var.EnableBGP
  express_route_gateway_bypass       = var.ExpressRoute-GatewayBypass
  use_policy_based_traffic_selectors = var.UsePolicyBasedTrafficSelectors

  virtual_network_gateway_id = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.id
  express_route_circuit_id   = data.azurerm_express_route_circuit.HubExpressRoute-ExpressRoute.id
}