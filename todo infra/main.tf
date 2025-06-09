module "resource_group" {
  source                  = "../module/azurerm_resource_group"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "vnet" {
  depends_on              = [module.resource_group]
  source                  = "../module/azurerm_virtual_network"
  virtual_network_name    = var.virtual_network_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "subnet_frontend" {
  depends_on           = [module.vnet]
  source               = "../module/azurerm_subnet_frontend"
  subnet_frontend      = "subnet_frontend"
  resource_group_name  = "chandanrg1"
  virtual_network_name = "vnet1"
  address_frefixes     = ["10.0.1.0/24"]
}

module "subnet_backend" {
  depends_on           = [module.vnet]
  source               = "../module/azurerm_subnet_frontend"
  subnet_frontend      = "subnet_backend"
  resource_group_name  = "chandanrg1"
  virtual_network_name = "vnet1"
  address_frefixes     = ["10.0.2.0/24"]
}
module "az-nic1" {
    source = "../module/azurerm_network_interface_frontend"
    network_interface_frontend = var.network_interface_frontend
    resource_group_location = var.resource_group_location
    resource_group_name = var.resource_group_name
}

module "az-nic2" {
    source = "../module/azurerm_network_interface_backend"
    network_interface_backend = var.network_interface_backend
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
    depends_on = [ module.az-sql ]
    source = "../module/azurerm_sql_database"
    sql_database_name = var.sql_database_name
}

module "az-vm" {
    source = "../module/azurerm_virtual_machine_frontend"
    frontend_vm = "frontend-vm"
    resource_group_name = "chandanrg1"
    resource_group_location = "west us 3"
    admin_username = "vmuser"
    admin_password = "Password@123"
    vm_size = "Standard_B1s"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-focal"
    image_sku = "20_04-lts"
    image_version = "latest"
    nic_name = "nic1"
    
}

module "backend-vm" {
    source = "../module/azurerm_virtual_machine_backend"
    backend_vm =   "backend-vm"
    resource_group_name = "chandanrg1"
    resource_group_location = "west us 3"
    admin_username = "vmuser"
    admin_password = "Password@123"
    vm_size = "Standard_B1s"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-focal"
    image_sku = "20_04-lts"
    image_version = "latest"
    nic_name = "nic2"
    
}