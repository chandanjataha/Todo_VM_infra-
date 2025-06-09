 resource "azurerm_subnet" "az-subnet" {
    name = var.subnet_frontend
    address_prefixes = var.address_frefixes
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
}

variable "subnet_frontend" {}
variable "resource_group_name" {}
variable "virtual_network_name" {}


variable "address_frefixes" {
  
}