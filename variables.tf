variable "azure_resource_group_name" { default = "terra01rg" }
variable "azure_resource_group_location" { default = "South Central US" }

variable "azurerm_storage_account_name" { default = "terra01sg00001" }
variable "azurerm_storage_account_account_type" { default = "Standard_LRS" }

variable "azurerm_virtual_machine_size" { default = "Standard_A1" }
variable "azurerm_virtual_machine_name" { default = "terra01vm" }

variable "azurerm_subnet_name" { default = "terra01sub" }
variable "azurerm_subnet_address_prefix" { default = "10.0.2.0/24" }

variable "azurerm_network_interface_name" { default = "terra01ni" }
variable "azurerm_network_interface_ip_configuration_name" { default = "testconfiguration1" }
variable "azurerm_network_interface_ip_configuration_private_ip_address_allocation" { default = "dynamic" }

variable "azurerm_public_ip_name" { default = "acceptanceTestPublicIp1" }
variable "azurerm_public_ip_public_ip_address_allocation" { default = "dynamic" }
variable "azurerm_public_ip_domain_name_label" { default = "terra01vm" }

variable "azurerm_virtual_network_name" { default = "terra01vn" }
