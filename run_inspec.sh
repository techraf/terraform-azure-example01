#!/bin/bash
inspec exec inspec -t winrm://terrastrator@terra01vm.southcentralus.cloudapp.azure.com --password 'UNSAFE**123!`#$%&**UNSAFE' --ssl --self-signed
