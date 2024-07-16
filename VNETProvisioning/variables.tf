variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
  default     = "RG-App-VNET"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
  default     = "westeurope"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "VNET-App"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet1_name" {
  description = "Name of subnet 1"
  type        = string
  default     = "AppSubnet"
}

variable "subnet1_address_prefix" {
  description = "Address prefix for subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_name" {
  description = "Name of subnet 2"
  type        = string
  default     = "DBSubnet"
}

variable "subnet2_address_prefix" {
  description = "Address prefix for subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}
