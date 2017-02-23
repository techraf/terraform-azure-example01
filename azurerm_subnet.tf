resource "azurerm_subnet" "test" {
    name = "${var.azurerm_subnet_name}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    virtual_network_name = "${azurerm_virtual_network.test.name}"
    address_prefix = "${var.azurerm_subnet_address_prefix}"
}
