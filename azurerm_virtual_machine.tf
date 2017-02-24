resource "azurerm_virtual_machine" "example01" {
    name = "${var.azurerm_virtual_machine_name}"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.example01.name}"
    network_interface_ids = ["${azurerm_network_interface.example01.id}"]
    vm_size = "${var.azurerm_virtual_machine_size}"

    storage_image_reference {
        publisher = "${var.azurerm_virtual_machine_storage_image_reference_publisher}"
        offer = "${var.azurerm_virtual_machine_storage_image_reference_offer}"
        sku = "${var.azurerm_virtual_machine_storage_image_reference_sku}"
        version = "${var.azurerm_virtual_machine_storage_image_reference_version}"
    }

    storage_os_disk {
        name = "myosdisk1"
        vhd_uri = "${azurerm_storage_account.example01.primary_blob_endpoint}${azurerm_storage_container.example01.name}/myosdisk1.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "${var.azurerm_virtual_machine_name}"
        admin_username = "${var.azurerm_virtual_machine_os_profile_admin_username}"
        admin_password = "${var.azurerm_virtual_machine_os_profile_admin_password}"
    }
}
