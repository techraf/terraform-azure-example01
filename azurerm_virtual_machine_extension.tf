resource "azurerm_virtual_machine_extension" "example01" {
    name = "WinRM"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.example01.name}"
    virtual_machine_name = "${azurerm_virtual_machine.example01.name}"
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
        command = "cd ./ansible && ansible-playbook -i inventory playbook.yml"
    }

}
