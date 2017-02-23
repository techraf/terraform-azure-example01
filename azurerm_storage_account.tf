resource "azurerm_storage_account" "test" {
    name = "${var.azurerm_storage_account_name}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    location = "${var.azure_resource_group_location}"
    account_type = "${var.azurerm_storage_account_account_type}"
}
