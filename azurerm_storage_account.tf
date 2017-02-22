resource "azurerm_storage_account" "test" {
    name = "terra01sg00001"
    resource_group_name = "${azurerm_resource_group.test.name}"
    location = "${var.azure_resource_group_location}"
    account_type = "Standard_LRS"
}
