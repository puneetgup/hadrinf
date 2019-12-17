resource "azurerm_public_ip" "AFW-PublicIP" {
  name                = "AWF-PIP"
  location            = azurerm_virtual_network.SharedServicesVNET.location
  resource_group_name = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  allocation_method   = var.AFWPIP-AllocationMethod
  sku                 = var.AFWPIP-SKU
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}

resource "azurerm_firewall" "AFW" {
  name                = "AzureFirewall"
  location            = azurerm_virtual_network.SharedServicesVNET.location
  resource_group_name = azurerm_virtual_network.SharedServicesVNET.resource_group_name

  ip_configuration {
    name                 = "AFW-Config"
    subnet_id            = azurerm_subnet.AzureFirewallSubnet.id
    public_ip_address_id = azurerm_public_ip.AFW-PublicIP.id
  }
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}