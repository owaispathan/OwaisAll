variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "OwaisVML"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
  default     = "RG-VM-TF"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "VNet-VM-TF"
}

variable "subnet_name" {
  description = "Name of the subnet within the virtual network"
  type        = string
  default     = "VMSubnet"
}
