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

module "vnets-Spoke1" {
  source                                              = "../Spoke1/"
  Spoke1-ResourceGroupLocation                              = var.Spoke1-ResourceGroupLocation
  Spoke1-VNet-AddressSpace                    = var.Spoke1-VNet-AddressSpace
  Spoke1-WebSubnet-AddressPrefix          = var.Spoke1-WebSubnet-AddressPrefix
  Spoke1-AppSubnet-AddressPrefix          = var.Spoke1-AppSubnet-AddressPrefix
  Spoke1-DataSubnet-AddressPrefix          = var.Spoke1-DataSubnet-AddressPrefix
}