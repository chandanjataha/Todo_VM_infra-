resource "azurerm_public_ip" "az-pip" {
    name = var.pip
    resource_group_name = var.resource_group_name
    location = var.resource_group_location
    allocation_method = "Static"
}

variable "pip" {}
variable "resource_group_name" {}
variable "resource_group_location" {}