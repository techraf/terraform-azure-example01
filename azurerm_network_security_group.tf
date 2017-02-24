resource "azurerm_network_security_group" "test" {
    name = "terra01sg"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_network_security_rule" "rdpRule" {
    name = "rdpRule"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "3389"
    source_address_prefix = "${format("%s/32", var.security_rule_enabled_ip_address)}"
    destination_address_prefix = "*"
    resource_group_name = "${azurerm_resource_group.test.name}"
    network_security_group_name = "${azurerm_network_security_group.test.name}"
}

resource "azurerm_network_security_rule" "winrmRule" {
    name = "winrmRule"
    priority = 110
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "5986"
    source_address_prefix = "${format("%s/32", var.security_rule_enabled_ip_address)}"
    destination_address_prefix = "*"
    resource_group_name = "${azurerm_resource_group.test.name}"
    network_security_group_name = "${azurerm_network_security_group.test.name}"
}
