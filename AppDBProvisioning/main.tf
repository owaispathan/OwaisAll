provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}

resource "azurerm_resource_group" "appdb" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "appdb" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
}

resource "azurerm_subnet" "appdb" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.appdb.name
  address_prefixes     = ["10.0.0.0/24"]

  delegation {
    name = "managedinstancedelegation"

    service_delegation {
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
} 

resource "azurerm_service_plan" "appdb" {
  name                = "${var.app_service_name}-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "appdb" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appdb.id

  site_config {}
}

resource "azurerm_mssql_managed_instance" "appdb" {
  name                         = var.sql_instance_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  subnet_id                    = azurerm_subnet.appdb.id
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234"
  license_type                 = var.sql_license_type
  sku_name                     = var.sql_instance_sku
  vcores                       = var.sql_vcore
  storage_size_in_gb           = var.storage_size_in_gb
  storage_account_type         = "LRS" 
}

#data "azurerm_subnet" "appdb" {
#  name                 = var.subnet_name
#  virtual_network_name = var.vnet_name
#  resource_group_name  = var.resource_group_name
#}

#resource "azurerm_role_assignment" "appdb" {
#  scope                = azurerm_mssql_managed_instance.appdb.id
#  role_definition_name = "Contributor"
#  principal_id         = data.azurerm_client_config.current.object_id
#}
