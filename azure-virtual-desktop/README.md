# Azure Virtual Desktop Terraform Configuration

This repository contains Terraform configurations for deploying `Azure Virtual Desktop`. The purpose of this repository is to provide an easy method for managing & deploying a complete Azure Virtual Desktop solution that contains all the nessacary resources to get started. Resources within this repository will be named dynamiclly using the following convention: `resourcetype-environment-application-location-instance` based on values listed in the `varibles.tf` file.

## Repository Structure

Below is a detailed list of each file in this repository and its purpose:

- **hosts.tf**: This file includes the configuration for the virtual machines host(s) that will be used for Azure Virtual Desktop. This includes the VM size, os-image, patching and other relevant settings. This also includes configuration of following VM extensions: 'AD Domain Join' + 'Host Pool Join'

- **logs.tf**: This file contains configuration for an Log Analytics Workspace(LAW) for centralised data logging regarding user sessions, host performace, application useage & system events (Optional) 

- **main.tf**: This file contains the main configuration of the primary resourcs for the Azure Virtual Desktop. This includes the avd resource group, hostpool, workspace & desktop application group(DAG) 

- **network.tf**: This file contains the configuration for deploying a Virtual Network(VNET) & virtual subnet(SNET) in a seperate resource group.
Deployment of a Network Security Group(NSG) + default RDP rule is also defined here. 

- **outputs.tf**: This file defines the outputs of the Terraform configuration. It provides useful information about the deployed resources, such as IP addresses and resource IDs, which can be used for further configuration or integration.

- **providers.tf**: This file specifies the providers required for the Terraform configuration. It includes the Azure provider and any other necessary providers for the deployment.

- **README.md**: This file provides an overview of the repository and detailed information about each file and its purpose.

- **storage.tf**: This file contains the configuration for two storage accounts, the first storage account for using FSLogix for roaming profile storage, the second for MSIX Application package storage.

- **variables.tf**: This file contains the variable definitions used in the Terraform configuration. It allows for customization of the deployment by setting values for various parameters such as: location, workload/ application, size & tagging. Please see file for full list. 

## Getting Started

To deploy the `Azure Virtual Desktop` environment using this Terraform configuration, follow these steps:

1. Clone this repository to your local machine.
2. Install Terraform if you haven't already.
3. Configure your Azure credentials.
4. Customize the `variables.tf` file to suit your own envrionment(s)
5. Run `terraform init` to initialize the configuration.
6. Run `terraform plan` to review the planned changes.
7. Run `terraform apply` to deploy the AVD solution.
8. Troubleshoot & perform any additional required configuration.

For more information please see the following: `https://developer.hashicorp.com/terraform/tutorials` & `https://learn.microsoft.com/en-us/azure/virtual-desktop/`

## Contributing

If you would like to contribute to this repository, please fork the repository and submit a pull request with your changes. I welcome any contributions that improve the functionality, security, and usability of the configuration.

## Authors
Daniel Powley

## License

This repository is licensed under the MIT License. See the `LICENSE` file for more information.