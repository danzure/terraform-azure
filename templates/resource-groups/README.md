# Azure Resource Group Terraform Configuration

This repository contains Terraform configuration for deploying Azure `Resource Groups`. The purpose of this repository is to provide an easy to use method for deploying one or more Azure resource groups that will be named dynamiclly named using the following convention: `rg-environment-application-location-instance` based on the values listed in the `varibles.tf` file.  

## Repository Structure

Below is a detailed list of each file in this repository and its purpose:

- **main.tf**: This file contains the main configuration for the resource group(s)

- **outputs.tf**: This file defines the outputs of the Terraform configuration. It provides useful information about the deployed resources

- **providers.tf**: This file specifies the nessacary providers such as the azurerm provider for the deployment

- **README.md**: This file provides an overview of the repository and detailed information about each file and its purpose.

- **variables.tf**: This file contains the variable definitions used in the configuration. It allows for customization of the deployment by setting values for various parameters such as: location, workload & envrionment

## Getting Started

To deploy the Azure `Resource Group(s)` using this Terraform configuration, follow these steps:

1. Clone this repository to your local machine.
2. Install Terraform if you haven't already.
3. Configure your Azure credentials. 
4. Customize the `variables.tf` file to suit your own envrionment(s)
5. Run `terraform init` to initialize the configuration.
6. Run `terraform plan` to review the planned changes.
7. Run `terraform apply` to deploy the resources.

For more information please see the following: `https://developer.hashicorp.com/terraform/tutorials`

## Contributing

If you would like to contribute to this repository, please fork the repository and submit a pull request with your changes. I welcome any contributions that improve the functionality, security, and usability of the configuration.

## Authors
Daniel Powley

## License

This repository is licensed under the MIT License. See the `LICENSE` file for more information.