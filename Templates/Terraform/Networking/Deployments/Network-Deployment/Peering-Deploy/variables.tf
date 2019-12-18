// variable "SharedServicesResourceGroupLocation" {
//   type        = string
//   description = "The location to deploy the Resource Group."
// }

// variable "SharedServices-VNet-AddressSpace" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Shared Services VNet."
// }

// variable "SharedServices-GatewaySubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Gateway Subnet within the Shared Services VNet."
// }

// variable "SharedServices-AzureFirewallSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Azure Firewall Subnet within the Shared Services VNet."
// }

// variable "SharedServices-DomainControllerSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Domain Controller Subnet within the Shared Services VNet."
// }


// variable "Prod-ResourceGroupLocation" {
//   type        = string
//   description = "The location to deploy the Resource Group."
// }

// variable "Prod-VNet-AddressSpace" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Prod VNet."
// }

// variable "Prod-WebSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Web Subnet within the Prod VNet."
// }

// variable "Prod-AppSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the App Subnet within the Prod VNet."
// }

// variable "Prod-DataSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Data Subnet within the Prod VNet."
// }


// variable "NonProd-ResourceGroupLocation" {
//   type        = string
//   description = "The location to deploy the Resource Group."
// }

// variable "NonProd-VNet-AddressSpace" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the NonProd VNet."
// }

// variable "NonProd-WebSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Web Subnet within the NonProd VNet."
// }

// variable "NonProd-AppSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the App Subnet within the NonProd VNet."
// }

// variable "NonProd-DataSubnet-AddressPrefix" {
//   type        = string
//   description = "The address space (ie. 1.2.3.4/56) for the Data Subnet within the NonProd VNet."
// }


variable "HubVNet-AllowVNetAccess" {
  type        = string
  description = "Enable communication between the two virtual networks."
}

variable "HubVNet-AllowForwardedTraffic" {
  type        = string
  description = "Allow traffic forwarded by a network virtual appliance in a virtual network (that didn't originate from the virtual network) to flow to this virtual network through a peering."
}

variable "HubVNet-AllowGatewayTransit" {
  type        = string
  description = "If you have a virtual network gateway attached to this virtual network and want to allow traffic from the peered virtual network to flow through the gateway. "
}



variable "ProdVNet-AllowVNetAccess" {
  type        = string
  description = "Enable communication between the two virtual networks."
}

variable "ProdVNet-AllowForwardedTraffic" {
  type        = string
  description = "Allow traffic forwarded by a network virtual appliance in a virtual network (that didn't originate from the virtual network) to flow to this virtual network through a peering."
}

variable "ProdVNet-AllowGatewayTransit" {
  type        = string
  description = "If you have a virtual network gateway attached to this virtual network and want to allow traffic from the peered virtual network to flow through the gateway. "
}



variable "NonProdVNet-AllowVNetAccess" {
  type        = string
  description = "Enable communication between the two virtual networks."
}

variable "NonProdVNet-AllowForwardedTraffic" {
  type        = string
  description = "Allow traffic forwarded by a network virtual appliance in a virtual network (that didn't originate from the virtual network) to flow to this virtual network through a peering."
}

variable "NonProdVNet-AllowGatewayTransit" {
  type        = string
  description = "If you have a virtual network gateway attached to this virtual network and want to allow traffic from the peered virtual network to flow through the gateway. "
}

// variable "EnableVPNGateway" {
//   type        = bool
//   description = "Control whether the VPN Gateway will be deployed or not."
// }
// variable "EnableERGateway" {
//   type        = bool
//   description = "Control whether the Express Route Gateway will be deployed or not."
// }

// variable "Hub-VPNGateway-ActiveActiveEnabled" {
//   type        = string
//   description = "Only select Enable active-active mode if you are creating an active-active gateway configuration."
// }
// variable "Hub-ERGateway-ActiveActiveEnabled" {
//   type        = string
//   description = "Only select Enable active-active mode if you are creating an active-active gateway configuration."
// }

// variable "Hub-VPNGateway-BGPEnabled" {
//   type        = string
//   description = "'True' or 'False' whether BGP is enabled."
// }
// variable "Hub-ERGateway-BGPEnabled" {
//   type        = string
//   description = "'True' or 'False' whether BGP is enabled."
// }

// variable "Hub-ERGateway-SKU" {
//   type        = string
//   description = "Set the specific ExpressRoute Gateway SKU. Available options include: 'Standard', 'HighPerformance', or 'UltraPerformance'"
// }
// variable "Hub-VPNGateway-SKU" {
//   type        = string
//   description = "Set the specific S2S VPN Gateway SKU. Available options include: VpnGw1, VpnGw2, VpnGw3, Standard, and HighPerformance."
// }

// variable "AFWPIP-AllocationMethod" {
//   type        = string
//   description = "Options include 'Dynamic' or 'Static'."
// }
// variable "AFWPIP-SKU" {
//   type        = string
//   description = "Options are 'Basic' or 'Standard'."
// }