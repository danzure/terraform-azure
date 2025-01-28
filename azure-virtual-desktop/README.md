# Azure Virtual Desktop Terraform Configuration

This repository contains Terraform configurations for setting up an Azure Virtual Desktop environment, please see the prerequisite & components below. 

## Prerequisites
Please ensure you meet the minimal requirements before proceeding with this repository

- Terraform v0.12 or later
- Azure subscription

## Components 

- Azure Virtual Desktop Envrionment
- Networking Infrastructure
- Session Hosts
- Profile Storage
- 

## Configuration Files

Below is a list of the Terraform files included in this repository and a description of their purpose

### `main.tf`
This file contains the primary configuration for the Azure Virtual Desktop environment including the Resource Group, DAG, Host Pool & AVD Workspace

### `variables.tf`
This file defines the input variables used throughout the Terraform configuration. It allows for customization and parameterization of the deployment.

### `outputs.tf`
This file specifies the outputs of the Terraform configuration, providing useful information about the deployed resources.

### `providers.tf`
This file configures the necessary providers for the Terraform deployment, such as the Azure provider.

### `network.tf`
This file contains the configuration for the virtual network and subnet(s) required for the Azure Virtual Desktop environment.

### `storage.tf`
This file contains the configuartion for the storage account used for profile storage with a solution such as FSLogix 

### `hosts.tf`
This file specified the configuration of the AVD host machines


## Usage

To deploy the Azure Virtual Desktop environment, follow these steps:

1. Initialize the Terraform configuration:
    ```sh
    terraform init
    ```

2. Review the execution plan:
    ```sh
    terraform plan
    ```

3. Apply the configuration:
    ```sh
    terraform apply
    ```

## Authors

- Daniel Powley 

## License
This project is licensed under the MIT License.