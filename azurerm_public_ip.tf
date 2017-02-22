resource "azurerm_public_ip" "test" {
    name = "acceptanceTestPublicIp1"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    public_ip_address_allocation = "dynamic"
    domain_name_label = "terra01vm"
}
