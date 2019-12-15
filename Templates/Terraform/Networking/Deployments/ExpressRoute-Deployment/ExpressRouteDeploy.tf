provider "azurerm" {
  # alias = "ShdSvc"
  version = ">=1.38.0"
  //   subscription_id = ""
  #(Optional) The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable.

  //   client_id = ""
  #(Optional) The Client ID which should be used. This can also be sourced from the ARM_CLIENT_ID Environment Variable.
  //   client_secret = ""
  //   tenant_id     = ""
  #(Optional) The Tenant ID which should be used. This can also be sourced from the ARM_TENANT_ID Environment Variable.

  environment = "public"
  #(Optional) The Cloud Environment which should be used. Possible values are public, usgovernment, german and china. Defaults to public. This can also be sourced from the ARM_ENVIRONMENT environment variable.
}

# Allows what version of Terraform to use.
terraform {
  required_version = ">=0.12.0"
  # Backend for configuring remote state files to Azure Storage
  backend "remote" {
    organization = "AdinErmie"
    workspaces {
      name = "HA-DR-Infrastructure-Examples-ExpressRoute"
    }
  }
}

module "ER-Circuit" {
  source                                 = "../../ExpressRoute/Circuit"
  HubExpressRoute-RGName                 = var.HubExpressRoute-RGName
  HubExpressRoute-Location               = var.HubExpressRoute-Location
  HubExpressRoute-ServiceProviderName    = var.HubExpressRoute-ServiceProviderName
  HubExpressRoute-PeeringLocation        = var.HubExpressRoute-PeeringLocation
  HubExpressRoute-BandwidthInMBPS        = var.HubExpressRoute-BandwidthInMBPS
  HubExpressRoute-Tier                   = var.HubExpressRoute-Tier
  HubExpressRoute-Family                 = var.HubExpressRoute-Family
  HubExpressRoute-AllowClassicOperations = var.HubExpressRoute-AllowClassicOperations
}

module "ER-Connection" {
  source                          = "../../ExpressRoute/Connection"
  HubExpressRoute-PeeringLocation = var.HubExpressRoute-PeeringLocation
  ConnectionType                  = var.ConnectionType
  RouteWeight                     = var.RouteWeight
  EnableBGP                       = var.EnableBGP
  ExpressRoute-GatewayBypass      = var.ExpressRoute-GatewayBypass
  UsePolicyBasedTrafficSelectors  = var.UsePolicyBasedTrafficSelectors

  Hub-ExpressRouteCircuit-Name    = module.ER-Circuit.Hub-ExpressRouteCircuit-Name
  Hub-ExpressRouteCircuit-RGName  = module.ER-Circuit.Hub-ExpressRouteCircuit-RGName
  Hub-ERGateway-Name              = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.name
  HubExpressRoute-GatewayLocation = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.location
  Hub-ERGateway-RGName            = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.resource_group_name

  HubExpressRoute-GatewayID      = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.id
  HubExpressRoute-ExpressRouteID = module.ER-Circuit.HubExpressRoute-ExpressRouteID
}

module "ER-Peering" {
  source                     = "../../ExpressRoute/Peering"
  ExpressRoute-PeeringType   = "AzurePrivatePeering"
  ExpressRoute-CircuitName   = module.ER-Circuit.Hub-ExpressRouteCircuit-Name
  ExpressRoute-RGName        = module.ER-Circuit.Hub-ExpressRouteCircuit-RGName
  PeerASN                    = var.PeerASN
  PrimaryPeerAddressPrefix   = var.PrimaryPeerAddressPrefix
  SecondaryPeerAddressPrefix = var.SecondaryPeerAddressPrefix
  VLANID                     = var.VLANID
}