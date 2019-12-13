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