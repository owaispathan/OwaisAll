variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
  default     = "RG-AppDB"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
  default     = "qatarcentral"
}

variable "vnet_name" {
  description = "Name of the existing virtual network"
  type        = string
  default     = "App-VNET"
}

variable "subnet_name" {
  description = "Name of the subnet within the existing virtual network"
  type        = string
  default     = "AppSubnet"
}

variable "app_service_name" {
  description = "Name of the Azure App Service"
  type        = string
  default     = "appservice07160090932"
}

variable "sql_instance_name" {
  description = "Name of the Azure SQL Managed Instance"
  type        = string
  default     = "sqlmi07160090932"
}

variable "sql_instance_sku" {
  description = "SKU (e.g., GP_Gen5_2) of the SQL Managed Instance"
  type        = string
  default     = "GP_Gen5"
}

variable "sql_license_type" {
  description = "License type for SQL Managed Instance (BasePrice or LicenseIncluded)"
  type        = string
  default     = "BasePrice"
}

variable "sql_storage_size_gb" {
  description = "Storage size for SQL Managed Instance in gigabytes"
  type        = number
  default     = 128
}

variable "storage_size_in_gb" {
  description = "Storage size for SQL Managed Instance in gigabytes"
  type        = number
  default     = 128
}

variable "sql_vcore" {
  description = "Number of vCores for SQL Managed Instance"
  type        = number
  default     = 4
}
