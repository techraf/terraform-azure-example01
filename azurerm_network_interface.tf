resource "azurerm_network_interface" "example01" {
    name = "${var.azurerm_network_interface_name}"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.example01.name}"
    network_security_group_id = "${azurerm_network_security_group.example01.id}"

    ip_configuration {
        name = "${var.azurerm_network_interface_ip_configuration_name}"
        subnet_id = "${azurerm_subnet.example01.id}"
        private_ip_address_allocation = "${var.azurerm_network_interface_ip_configuration_private_ip_address_allocation}"
        public_ip_address_id = "${azurerm_public_ip.example01.id}"
    }
}
