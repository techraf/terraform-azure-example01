resource "azurerm_storage_account" "test" {
    name = "terra01sg00001"
    resource_group_name = "${azurerm_resource_group.test.name}"
    location = "South Central US"
    account_type = "Standard_LRS"
}
