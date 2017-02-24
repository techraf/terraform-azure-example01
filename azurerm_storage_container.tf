resource "azurerm_storage_container" "example01" {
    name = "${var.azurerm_storage_container_name}"
    resource_group_name = "${azurerm_resource_group.example01.name}"
    storage_account_name = "${azurerm_storage_account.example01.name}"
    container_access_type = "${var.azurerm_storage_container_container_access_type}"
}
