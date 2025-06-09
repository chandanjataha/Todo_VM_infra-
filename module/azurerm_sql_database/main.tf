resource "azurerm_mssql_database" "az-database" {
    name = var.sql_database_name
    server_id = "/subscriptions/1212a59c-637f-45eb-8b74-8032483be797/resourceGroups/chandanrg1/providers/Microsoft.Sql/servers/sql-server00010"
    collation =  "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb = 2
    sku_name = "S0"
    enclave_type = "VBS"
}

variable "sql_database_name" {}

