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

variable "Hub-ERGateway-ActiveActiveEnabled" {
  type        = string
  description = "Only select Enable active-active mode if you are creating an active-active gateway configuration."
}
variable "Hub-ERGateway-BGPEnabled" {
  type        = string
  description = "'True' or 'False' whether BGP is enabled."
}
variable "Hub-ERGateway-SKU" {
  type        = string
  description = "Set the specific ExpressRoute Gateway SKU. Available options include: 'Standard', 'HighPerformance', or 'UltraPerformance'"
}