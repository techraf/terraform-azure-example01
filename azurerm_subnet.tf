resource "azurerm_subnet" "example01" {
    name = "${var.azurerm_subnet_name}"
    resource_group_name = "${azurerm_resource_group.example01.name}"
    virtual_network_name = "${azurerm_virtual_network.example01.name}"
    address_prefix = "${var.azurerm_subnet_address_prefix}"
}
