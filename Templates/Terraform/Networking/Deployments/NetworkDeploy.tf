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
      name = "HA-DR-Infrastructure-Examples"
    }
  }
}

module "vnets-SharedServices" {
  source                                              = "../Hub/"
  SharedServicesResourceGroupLocation                               = var.SharedServicesResourceGroupLocation
  SharedServices-VNet-AddressSpace                    = var.SharedServices-VNet-AddressSpace
  SharedServices-GatewaySubnet-AddressPrefix          = var.SharedServices-GatewaySubnet-AddressPrefix
  SharedServices-DomainControllerSubnet-AddressPrefix = var.SharedServices-DomainControllerSubnet-AddressPrefix
}

module "vnets-Prod" {
  source                                              = "../Spoke-Prod/"
  Prod-ResourceGroupLocation                              = var.Prod-ResourceGroupLocation
  Prod-VNet-AddressSpace                    = var.Prod-VNet-AddressSpace
  Prod-WebSubnet-AddressPrefix          = var.Prod-WebSubnet-AddressPrefix
  Prod-AppSubnet-AddressPrefix          = var.Prod-AppSubnet-AddressPrefix
  Prod-DataSubnet-AddressPrefix          = var.Prod-DataSubnet-AddressPrefix
}

module "vnets-NonProd" {
  source                                              = "../Spoke-NonProd/"
  NonProd-ResourceGroupLocation                              = var.NonProd-ResourceGroupLocation
  NonProd-VNet-AddressSpace                    = var.NonProd-VNet-AddressSpace
  NonProd-WebSubnet-AddressPrefix          = var.NonProd-WebSubnet-AddressPrefix
  NonProd-AppSubnet-AddressPrefix          = var.NonProd-AppSubnet-AddressPrefix
  NonProd-DataSubnet-AddressPrefix          = var.NonProd-DataSubnet-AddressPrefix
}


module "Hub2Prod-VNET-Peering" {
  source = "../VNetPeering"
  HubVNet-RGName = module.vnets-SharedServices.SharedServices-RGName
  HubVNet-Name = module.vnets-SharedServices.SharedServices-VNet-Name
  ProdNetwork-ID = module.vnets-Prod.Prod-VNet-ID
  HubVNet-AllowVNetAccess = var.HubVNet-AllowVNetAccess
  HubVNet-AllowForwardedTraffic = var.HubVNet-AllowForwardedTraffic
  HubVNet-AllowGatewayTransit = var.HubVNet-AllowGatewayTransit
  // depends_on = [
  //   module.vnets-SharedServices, module.vnets-Prod
  // ]

  ProdVNet-RGName = module.vnets-Prod.Prod-RGName
  ProdVNet-Name = module.vnets-Prod.Prod-VNet-Name
  HubNetwork-ID = module.vnets-SharedServices.SharedServices-VNet-ID
  ProdVNet-AllowVNetAccess = var.ProdVNet-AllowVNetAccess
  ProdVNet-AllowForwardedTraffic = var.ProdVNet-AllowForwardedTraffic
  ProdVNet-AllowGatewayTransit = var.ProdVNet-AllowGatewayTransit
}