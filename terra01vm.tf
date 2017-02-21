resource "azurerm_resource_group" "test" {
    name = "terra01rg"
    location = "South Central US"
}

resource "azurerm_virtual_network" "test" {
    name = "terra01vn"
    address_space = ["10.0.0.0/16"]
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_subnet" "test" {
    name = "terra01sub"
    resource_group_name = "${azurerm_resource_group.test.name}"
    virtual_network_name = "${azurerm_virtual_network.test.name}"
    address_prefix = "10.0.2.0/24"
}

resource "azurerm_public_ip" "test" {
    name = "acceptanceTestPublicIp1"
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
    public_ip_address_allocation = "dynamic"
    domain_name_label = "terra01vm"
}

resource "azurerm_network_interface" "test" {
    name = "terra01ni"
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"

    ip_configuration {
        name = "testconfiguration1"
        subnet_id = "${azurerm_subnet.test.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = "${azurerm_public_ip.test.id}"
    }
}

resource "azurerm_storage_account" "test" {
    name = "terra01sg00001"
    resource_group_name = "${azurerm_resource_group.test.name}"
    location = "South Central US"
    account_type = "Standard_LRS"
}

resource "azurerm_storage_container" "test" {
    name = "vhds"
    resource_group_name = "${azurerm_resource_group.test.name}"
    storage_account_name = "${azurerm_storage_account.test.name}"
    container_access_type = "private"
}

resource "azurerm_virtual_machine" "test" {
    name = "terra01vm"
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
    network_interface_ids = ["${azurerm_network_interface.test.id}"]
    vm_size = "Standard_A1"

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
        computer_name = "terra01vm"
        admin_username = "terrastrator"
        admin_password = "UNSAFE**123!`#$%&**UNSAFE"
    }
}

resource "azurerm_virtual_machine_extension" "test" {
    name = "WinRM"
    location = "South Central US"
    resource_group_name = "${azurerm_resource_group.test.name}"
    virtual_machine_name = "${azurerm_virtual_machine.test.name}"
    publisher = "Microsoft.Compute"
    type = "CustomScriptExtension"
    type_handler_version = "1.8"

    settings = <<SETTINGS
    {
        "fileUris": [
          "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
        ],
        "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File ConfigureRemotingForAnsible.ps1"
    }
SETTINGS

    provisioner "local-exec" {
        command = "ansible-playbook -i inventory playbook.yml"
    }

}
