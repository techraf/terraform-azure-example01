resource "azurerm_public_ip" "example01" {
    name = "${var.azurerm_public_ip_name}"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.example01.name}"
    public_ip_address_allocation = "${var.azurerm_public_ip_public_ip_address_allocation}"
    domain_name_label = "${var.azurerm_public_ip_domain_name_label}"
}
