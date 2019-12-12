variable "SharedServicesResourceGroupLocation" {
  type        = "string"
  description = "The location to deploy the Resource Group."
  default     = "WestUS"
}

variable "SharedServices-VNet-AddressSpace" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Shared Services VNet."
  default     = "10.0.0.0/16"
}

variable "SharedServices-GatewaySubnet-AddressPrefix" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Gateway Subnet within the Shared Services VNet."
  default     = "10.0.1.0/27"
}

variable "SharedServices-DomainControllerSubnet-AddressPrefix" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Domain Controller Subnet within the Shared Services VNet."
  default     = "10.0.2.0/24"
}