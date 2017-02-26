resource "azurerm_network_security_group" "example01" {
    name = "terra01sg"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.example01.name}"
}
