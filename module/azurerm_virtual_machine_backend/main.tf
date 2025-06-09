resource "azurerm_linux_virtual_machine" "vm2" {
  name                         = var.backend_vm
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    "/subscriptions/1212a59c-637f-45eb-8b74-8032483be797/resourceGroups/chandanrg1/providers/Microsoft.Network/networkInterfaces/nic2"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher # Published ID from Azure Marketplace
    offer     = var.image_offer     # Product ID from Azure Marketplace
    sku       = var.image_sku       # Plan ID from Azure Marketplace
    version   = var.image_version   # Version of the image
  }
}
variable "backend_vm" {}
variable "resource_group_name" {}
variable "resource_group_location" {}
variable "admin_username" {}
variable "vm_size" {}
variable "image_publisher" {}
variable "image_offer" {}
variable "image_sku" {}
variable "image_version" {}
variable "admin_password" {}
variable "nic_name" {}

  
