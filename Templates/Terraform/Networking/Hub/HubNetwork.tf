resource "azurerm_resource_group" "SharedServicesRG" {
  name     = "SharedServicesRG"
  location = var.SharedServicesResourceGroupLocation
}

# NOTE: Have to create the NSGs first (and in the same TF file as the Subnets, instead of in its own module), 
# due to a bug in the AzureRM Provider (which "should" be fixed in v2.0)
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
  destination_address_prefix                 = "*"
  resource_group_name                        = azurerm_network_security_group.DomainControllerSubnetNSG.resource_group_name
  network_security_group_name                = azurerm_network_security_group.DomainControllerSubnetNSG.name
}

resource "azurerm_virtual_network" "SharedServicesVNET" {
  name                = "SharedServicesVNET"
  location            = azurerm_resource_group.SharedServicesRG.location
  resource_group_name = azurerm_resource_group.SharedServicesRG.name
  address_space       = [var.SharedServices-VNet-AddressSpace]
}

resource "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  address_prefix       = var.SharedServices-GatewaySubnet-AddressPrefix
  resource_group_name  = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.SharedServicesVNET.name
}

resource "azurerm_subnet" "DomainControllerSubnet" {
  name                 = "DomainControllerSubnet"
  address_prefix       = var.SharedServices-DomainControllerSubnet-AddressPrefix
  resource_group_name  = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.SharedServicesVNET.name
  network_security_group_id = azurerm_network_security_group.DomainControllerSubnetNSG.id
}

resource "azurerm_subnet_network_security_group_association" "DomainController-NSGAssociation" {
  subnet_id = azurerm_subnet.DomainControllerSubnet.id
  network_security_group_id = azurerm_network_security_group.DomainControllerSubnetNSG.id
}