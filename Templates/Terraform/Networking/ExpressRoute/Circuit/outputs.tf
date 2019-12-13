output "HubExpressRoute-ID" {
  value = azurerm_express_route_circuit.HubExpressRoute.id
}
output "HubExpressRoute-Name" {
  value = azurerm_express_route_circuit.HubExpressRoute.name
}
output "HubExpressRoute-RGName" {
  value = azurerm_express_route_circuit.HubExpressRoute.resource_group_name
}

output "HubExpressRoute-ServiceProvider_ProvisioningState" {
  value = azurerm_express_route_circuit.HubExpressRoute.service_provider_provisioning_state
}

output "HubExpressRoute-ServiceKey" {
  value = azurerm_express_route_circuit.HubExpressRoute.service_key
}