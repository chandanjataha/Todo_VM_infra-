 resource "azurerm_subnet" "az-subnet" {
    name = var.azurerm_subnet
    address_prefixes = ["10.0.1.0/24"]
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
}

variable "azurerm_subnet" {}
variable "resource_group_name" {}
variable "virtual_network_name" {}
