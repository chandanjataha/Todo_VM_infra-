resource "azurerm_virtual_network" "az-vnet"{
name = var.virtual_network_name
location = var.resource_group_location
resource_group_name = var.resource_group_name

address_space =  ["10.0.0.0/16"]

}

variable "virtual_network_name" {}
variable "resource_group_name" {}
variable "resource_group_location" {}