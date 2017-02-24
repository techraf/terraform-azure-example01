resource "azurerm_resource_group" "example01" {
    name = "${var.azure_resource_group_name}"
    location = "${var.azure_resource_group_location}"
}
