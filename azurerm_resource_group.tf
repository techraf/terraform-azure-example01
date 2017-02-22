resource "azurerm_resource_group" "test" {
    name = "${var.azure_resource_group_name}"
    location = "${var.azure_resource_group_location}"
}
