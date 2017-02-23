resource "azurerm_network_interface" "test" {
    name = "${var.azurerm_network_interface_name}"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.test.name}"

    ip_configuration {
        name = "${var.azurerm_network_interface_ip_configuration_name}"
        subnet_id = "${azurerm_subnet.test.id}"
        private_ip_address_allocation = "${var.azurerm_network_interface_ip_configuration_private_ip_address_allocation}"
        public_ip_address_id = "${azurerm_public_ip.test.id}"
    }
}
