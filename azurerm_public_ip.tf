resource "azurerm_public_ip" "test" {
    name = "acceptanceTestPublicIp1"
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
    public_ip_address_allocation = "dynamic"
    domain_name_label = "terra01vm"
}
