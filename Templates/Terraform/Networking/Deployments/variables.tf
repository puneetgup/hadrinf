variable "SharedServicesResourceGroupLocation" {
  type        = "string"
  description = "The location to deploy the Resource Group."
}

variable "SharedServices-VNet-AddressSpace" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Shared Services VNet."
}

variable "SharedServices-GatewaySubnet-AddressPrefix" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Gateway Subnet within the Shared Services VNet."
}

variable "SharedServices-DomainControllerSubnet-AddressPrefix" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Domain Controller Subnet within the Shared Services VNet."
}


variable "Spoke1-ResourceGroupLocation" {
  type        = "string"
  description = "The location to deploy the Resource Group."
}

variable "Spoke1-VNet-AddressSpace" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Spoke1 VNet."
}

variable "Spoke1-WebSubnet-AddressPrefix" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Web Subnet within the Spoke1 VNet."
}

variable "Spoke1-AppSubnet-AddressPrefix" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the App Subnet within the Spoke1 VNet."
}

variable "Spoke1-DataSubnet-AddressPrefix" {
  type        = "string"
  description = "The address space (ie. 1.2.3.4/56) for the Data Subnet within the Spoke1 VNet."
}