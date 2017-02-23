variable "azure_resource_group_name" {
    description = "Resource Group Name"
    default = "terra01rg"
}

variable "azure_resource_group_location" {
    description = "Resource Group Location"
    default = "South Central US"
}

variable "azurerm_virtual_machine_size" {
    description = "VM Size"
    default = "Standard_A1"
}

variable "azurerm_virtual_machine_name" {
    description = "VM Name"
    default = "terra01vm"
}

variable "enabled_ip_address" {}
