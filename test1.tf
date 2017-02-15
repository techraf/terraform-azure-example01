# provide credentials either in environment variables:
#   export ARM_SUBSCRIPTION_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#   export ARM_CLIENT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#   export ARM_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#   export ARM_TENANT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#
# or directly here:
#   provider "azurerm" {
#     subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#     client_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#     client_secret   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#     tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#   }

resource "azurerm_resource_group" "test" {
    name = "acctestrg"
    location = "South Central US"
}

resource "azurerm_virtual_network" "test" {
    name = "acctvn"
    address_space = ["10.0.0.0/16"]
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_subnet" "test" {
    name = "acctsub"
    resource_group_name = "${azurerm_resource_group.test.name}"
    virtual_network_name = "${azurerm_virtual_network.test.name}"
    address_prefix = "10.0.2.0/24"
}

resource "azurerm_network_interface" "test" {
    name = "acctni"
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"

    ip_configuration {
        name = "testconfiguration1"
        subnet_id = "${azurerm_subnet.test.id}"
        private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_storage_account" "test" {
    name = "techrafaccsa001"
    resource_group_name = "${azurerm_resource_group.test.name}"
    location = "South Central US"
    account_type = "Standard_LRS"

    tags {
        environment = "staging"
    }
}

resource "azurerm_storage_container" "test" {
    name = "vhds"
    resource_group_name = "${azurerm_resource_group.test.name}"
    storage_account_name = "${azurerm_storage_account.test.name}"
    container_access_type = "private"
}

resource "azurerm_virtual_machine" "test" {
    name = "acctvm"
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
    network_interface_ids = ["${azurerm_network_interface.test.id}"]
    vm_size = "Standard_A0"

    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }

    storage_os_disk {
        name = "myosdisk1"
        vhd_uri = "${azurerm_storage_account.test.primary_blob_endpoint}${azurerm_storage_container.test.name}/myosdisk1.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "hostname"
        admin_username = "rafadmin"
        admin_password = "UNSAFE**Pfmwif8R234fegr**UNSAFE"
    }

    tags {
        environment = "staging"
    }
}
