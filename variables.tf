variable "azure_resource_group_name" { default = "terra01rg" }
variable "azure_resource_group_location" { default = "South Central US" }

variable "azurerm_virtual_machine_size" { default = "Standard_A1" }
variable "azurerm_virtual_machine_name" { default = "terra01vm" }

variable "azurerm_subnet_name" { default = "terra01sub" }
variable "azurerm_subnet_address_prefix" { default = "10.0.2.0/24" }
