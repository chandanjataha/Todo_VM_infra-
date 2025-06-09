resource "azurerm_network_interface" "az-nic" {
    name = var.network_interface_frontend
    location = var.resource_group_location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name = "internal"
        subnet_id = "/subscriptions/1212a59c-637f-45eb-8b74-8032483be797/resourceGroups/chandanrg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet_frontend"
        private_ip_address_allocation = "Dynamic"

    }

}
variable "network_interface_frontend" {}
variable "resource_group_location" {}
variable "resource_group_name" {}