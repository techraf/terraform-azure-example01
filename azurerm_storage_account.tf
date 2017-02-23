resource "random_id" "test" {
   byte_length = 3
}

resource "azurerm_storage_account" "test" {
    # Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
    name = "${format("%s%s", var.azurerm_storage_account_name_constant_part, random_id.test.hex)}"
    resource_group_name = "${azurerm_resource_group.test.name}"
    location = "${var.azure_resource_group_location}"
    account_type = "${var.azurerm_storage_account_account_type}"
}
