resource "azurerm_mssql_server" "az-sql" {
    name = var.sql_server
    resource_group_name = var.resource_group_name
    location = var.resource_group_location
    version = "12.0"
    administrator_login = var.administrator_login
    administrator_login_password = var.administrator_login_password

}

variable "sql_server" {}
variable "resource_group_name" {}
variable "resource_group_location" {}
variable "administrator_login" {}
variable "administrator_login_password" {}