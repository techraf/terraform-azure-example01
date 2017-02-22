resource "azurerm_virtual_network" "test" {
    name = "terra01vn"
    address_space = ["10.0.0.0/16"]
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
}
