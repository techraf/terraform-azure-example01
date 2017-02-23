resource "azurerm_network_interface" "test" {
    name = "terra01ni"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    network_security_group_id = "${azurerm_network_security_group.test.id}"

    ip_configuration {
        name = "testconfiguration1"
        subnet_id = "${azurerm_subnet.test.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = "${azurerm_public_ip.test.id}"
    }
}
