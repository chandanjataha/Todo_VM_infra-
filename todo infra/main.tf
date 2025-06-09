module "resource_group" {
  source                  = "../module/azurerm_resource_group"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "vnet" {
    source = "../module/azurerm_virtual_network"
    virtual_network_name = var.virtual_network_name
    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location
}

module "subnet" {
    source = "../module/azurerm_subnet"
    azurerm_subnet = var.azurerm_subnet
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
}

module "az-nic" {
    source = "../module/azurerm_network_interface"
    network_interface = var.network_interface
    resource_group_location = var.resource_group_location
    resource_group_name = var.resource_group_name
}

module "az-pip" {
    source = "../module/azurerm_public_ip"
    pip = var.pip
    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location
}
module "az-sql" {
source = "../module/azurerm_sqlserver"
sql_server = var.sql_server
resource_group_name = var.resource_group_name
resource_group_location = var.resource_group_location
administrator_login = var.administrator_login
administrator_login_password = var.administrator_login_password

}
module "az-sql-database"{
    source = "../module/azurerm_sql_database"
    sql_database_name = var.sql_database_name
}

module "az-vm" {
    source = "../module/azurerm_virtual_machine"
    vm_name = var.vm_name
    resource_group_name = var.resource_group_name
    resource_group_location = var.resource_group_location
    admin_username = var.admin_username
    admin_password = var.admin_password
    vm_size = var.vm_size
    image_publisher = var.image_publisher
    image_offer = var.image_offer
    image_sku = var.image_sku
    image_version = var.image_version

}

