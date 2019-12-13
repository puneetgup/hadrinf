resource "azurerm_resource_group" "Spoke-NonProd-RG" {
  name     = "NonProdSpokeRG"
  location = var.NonProd-ResourceGroupLocation
}

# NOTE: Have to create the NSGs first (and in the same TF file as the Subnets, instead of in its own module), 
# due to a bug in the AzureRM Provider (which "should" be fixed in v2.0)
resource "azurerm_network_security_group" "WebSubnet-NSG" {
  name                = "WebSubnet-NSG"
  location            = azurerm_resource_group.Spoke-NonProd-RG.location
  resource_group_name = azurerm_resource_group.Spoke-NonProd-RG.name
}
resource "azurerm_network_security_group" "AppSubnet-NSG" {
  name                = "AppSubnet-NSG"
  location            = azurerm_resource_group.Spoke-NonProd-RG.location
  resource_group_name = azurerm_resource_group.Spoke-NonProd-RG.name
}
resource "azurerm_network_security_group" "DataSubnet-NSG" {
  name                = "DataSubnet-NSG"
  location            = azurerm_resource_group.Spoke-NonProd-RG.location
  resource_group_name = azurerm_resource_group.Spoke-NonProd-RG.name
}

resource "azurerm_network_security_rule" "WebSubnet-NSGRule_HTTPS" {
  name                                       = "HTTP_InBound"
  priority                                   = 100
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_range                     = "443"
  source_address_prefix                      = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = azurerm_network_security_group.WebSubnet-NSG.resource_group_name
  network_security_group_name                = azurerm_network_security_group.WebSubnet-NSG.name
}
resource "azurerm_network_security_rule" "AppSubnet-NSGRule_HTTP" {
  name                                       = "HTTP_InBound"
  priority                                   = 110
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "443"
  destination_port_range                     = "443"
  source_address_prefix                      = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = azurerm_network_security_group.AppSubnet-NSG.resource_group_name
  network_security_group_name                = azurerm_network_security_group.AppSubnet-NSG.name
}
resource "azurerm_network_security_rule" "DataSubnet-NSGRule_SQL" {
  name                                       = "HTTP_InBound"
  priority                                   = 120
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "*"
  source_port_range                          = "*"
  destination_port_range                     = "1433"
  source_address_prefix                      = "*"
  destination_address_prefix                 = "*"
  resource_group_name                        = azurerm_network_security_group.DataSubnet-NSG.resource_group_name
  network_security_group_name                = azurerm_network_security_group.DataSubnet-NSG.name
}

resource "azurerm_virtual_network" "NonProd-VNET" {
  name                = "NonProd-VNET"
  location            = azurerm_resource_group.Spoke-NonProd-RG.location
  resource_group_name = azurerm_resource_group.Spoke-NonProd-RG.name
  address_space       = [var.NonProd-VNet-AddressSpace]
}

resource "azurerm_subnet" "WebSubnet" {
  name                 = "WebSubnet"
  address_prefix       = var.NonProd-WebSubnet-AddressPrefix
  resource_group_name  = azurerm_virtual_network.NonProd-VNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.NonProd-VNET.name
  network_security_group_id = azurerm_network_security_group.WebSubnet-NSG.id
}
resource "azurerm_subnet" "AppSubnet" {
  name                 = "AppSubnet"
  address_prefix       = var.NonProd-AppSubnet-AddressPrefix
  resource_group_name  = azurerm_virtual_network.NonProd-VNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.NonProd-VNET.name
  network_security_group_id = azurerm_network_security_group.AppSubnet-NSG.id
}
resource "azurerm_subnet" "DataSubnet" {
  name                 = "DataSubnet"
  address_prefix       = var.NonProd-DataSubnet-AddressPrefix
  resource_group_name  = azurerm_virtual_network.NonProd-VNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.NonProd-VNET.name
  network_security_group_id = azurerm_network_security_group.DataSubnet-NSG.id
}

resource "azurerm_subnet_network_security_group_association" "WebSubnet-NSGAssociation" {
  subnet_id = azurerm_subnet.WebSubnet.id
  network_security_group_id = azurerm_network_security_group.WebSubnet-NSG.id
}
resource "azurerm_subnet_network_security_group_association" "AppSubnet-NSGAssociation" {
  subnet_id = azurerm_subnet.AppSubnet.id
  network_security_group_id = azurerm_network_security_group.AppSubnet-NSG.id
}
resource "azurerm_subnet_network_security_group_association" "DataSubnet-NSGAssociation" {
  subnet_id = azurerm_subnet.DataSubnet.id
  network_security_group_id = azurerm_network_security_group.DataSubnet-NSG.id
}