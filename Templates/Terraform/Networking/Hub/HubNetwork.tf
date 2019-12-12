provider "azurerm" {
//   version         >= "1.38.0"
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
//   backend "azurerm" {
//     storage_account_name = "AzureStorageAccount"
//     container_name       = "StorageContainer"
//     access_key = ""
//   }
}

resource "azurerm_resource_group" "SharedServicesRG" {
  name     = "SharedServicesRG"
  location = "WestUS"
}

resource "azurerm_virtual_network" "SharedServicesVNET" {
  name                = "SharedServicesVNET"
  location            = azurerm_resource_group.SharedServicesRG.location
  resource_group_name = azurerm_resource_group.SharedServicesRG.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  address_prefix       = "10.0.0.0/24"
  resource_group_name  = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.SharedServicesVNET.name
}

resource "azurerm_subnet" "DomainControllerSubnet" {
  name                 = "DomainControllerSubnet"
  address_prefix       = "10.0.1.0/24"
  resource_group_name  = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.SharedServicesVNET.name
}

resource "azurerm_network_security_group" "DomainControllerSubnetNSG" {
  name                = "DomainControllerSubnetNSG"
  location            = azurerm_resource_group.SharedServicesRG.location
  resource_group_name = azurerm_resource_group.SharedServicesRG.name
}

resource "azurerm_network_security_rule" "DomainControllerNSGRule_DNS" {
  name                                       = "DNS_InBound"
  priority                                   = 100
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_range                     = "53"
  source_address_prefix                      = "*"
  destination_address_prefix  = "*"
  resource_group_name                        = azurerm_network_security_group.DomainControllerSubnetNSG.resource_group_name
  network_security_group_name                = azurerm_network_security_group.DomainControllerSubnetNSG.name
}

resource "azurerm_subnet_network_security_group_association" "DomainController-NSGAssociation" {
  subnet_id = azurerm_subnet.DomainControllerSubnet.id
  network_security_group_id = azurerm_network_security_group.DomainControllerSubnetNSG.id
}