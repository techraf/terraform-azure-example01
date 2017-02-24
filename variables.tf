variable "azure_resource_group_name" { default = "terra01rg" }
variable "azure_resource_group_location" { default = "South Central US" }

# Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
variable "azurerm_storage_account_name_fixed_prefix" { default = "terra01sg" }
variable "azurerm_storage_account_account_type" { default = "Standard_LRS" }

variable "azurerm_storage_container_name" { default = "vhds" }
variable "azurerm_storage_container_container_access_type" { default = "private" }

variable "azurerm_subnet_name" { default = "terra01sub" }
variable "azurerm_subnet_address_prefix" { default = "10.0.2.0/24" }

variable "azurerm_network_interface_name" { default = "terra01ni" }
variable "azurerm_network_interface_ip_configuration_name" { default = "testconfiguration1" }
variable "azurerm_network_interface_ip_configuration_private_ip_address_allocation" { default = "dynamic" }

variable "azurerm_public_ip_name" { default = "acceptanceTestPublicIp1" }
variable "azurerm_public_ip_public_ip_address_allocation" { default = "dynamic" }
variable "azurerm_public_ip_domain_name_label" { default = "terra01vm" }

variable "azurerm_virtual_network_name" { default = "terra01vn" }
variable "azurerm_virtual_network_address_space" { default = ["10.0.0.0/16"] }

variable "azurerm_virtual_machine_name" { default = "terra01vm" }
variable "azurerm_virtual_machine_size" { default = "Standard_A1" }
variable "azurerm_virtual_machine_storage_image_reference_publisher" { default = "MicrosoftWindowsServer" }
variable "azurerm_virtual_machine_storage_image_reference_offer" { default = "WindowsServer" }
variable "azurerm_virtual_machine_storage_image_reference_sku" { default = "2016-Datacenter" }
variable "azurerm_virtual_machine_storage_image_reference_version" { default = "latest" }
# variable "azurerm_virtual_machine_os_profile_computer_name" { default = "${var.azurerm_virtual_machine_name}" }
variable "azurerm_virtual_machine_os_profile_admin_username" { default = "terrastrator" }
variable "azurerm_virtual_machine_os_profile_admin_password" { default = "UNSAFE**123!`#$%&**UNSAFE" }

variable "security_rule_enabled_ip_address" { description = "Use TF_VAR_enabled_ip_address=192.168.1.1 syntax" }
