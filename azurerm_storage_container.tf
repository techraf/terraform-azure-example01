resource "azurerm_storage_container" "test" {
    name = "${var.azurerm_storage_container_name}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    storage_account_name = "${azurerm_storage_account.test.name}"
    container_access_type = "${var.azurerm_storage_container_container_access_type}"
}
