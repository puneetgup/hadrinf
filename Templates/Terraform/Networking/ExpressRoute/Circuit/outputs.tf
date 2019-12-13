output "HubExpressRoute-ID" {
  value = azurerm_express_route_circuit.HubExpressRoute.id
}

output "HubExpressRoute-ServiceProvider_ProvisioningState" {
  value = azurerm_express_route_circuit.HubExpressRoute.service_provider_provisioning_state
}

output "HubExpressRoute-ServiceKey" {
  value = azurerm_express_route_circuit.HubExpressRoute.service_key
}