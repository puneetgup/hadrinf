variable "SharedServicesResourceGroupLocation" {
  type        = string
  description = "The location to deploy the Resource Group."
}

variable "SharedServices-VNet-AddressSpace" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Shared Services VNet."
}

variable "SharedServices-GatewaySubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Gateway Subnet within the Shared Services VNet."
}

variable "SharedServices-DomainControllerSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Domain Controller Subnet within the Shared Services VNet."
}


variable "Prod-ResourceGroupLocation" {
  type        = string
  description = "The location to deploy the Resource Group."
}

variable "Prod-VNet-AddressSpace" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Prod VNet."
}

variable "Prod-WebSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Web Subnet within the Prod VNet."
}

variable "Prod-AppSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the App Subnet within the Prod VNet."
}

variable "Prod-DataSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Data Subnet within the Prod VNet."
}


variable "NonProd-ResourceGroupLocation" {
  type        = string
  description = "The location to deploy the Resource Group."
}

variable "NonProd-VNet-AddressSpace" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the NonProd VNet."
}

variable "NonProd-WebSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Web Subnet within the NonProd VNet."
}

variable "NonProd-AppSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the App Subnet within the NonProd VNet."
}

variable "NonProd-DataSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Data Subnet within the NonProd VNet."
}


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