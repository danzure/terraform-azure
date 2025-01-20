# Azure Virtual Desktop Terraform Configuration

This repository contains Terraform configuration files to deploy an Azure Virtual Desktop environment.

## Overview

The configuration includes the following resources:
- Virtual Network
- Subnets
- Network Security Groups
- Azure Virtual Desktop Host Pool
- Session Hosts
- Application Groups
- User Assignments

## Prerequisites

- Azure Subscription
- Terraform installed on your local machine
- Azure CLI installed and configured

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/terraform-azure/terraform-azure-virtual-desktop.git
    cd terraform-azure-virtual-desktop
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Review and modify the `variables.tf` file to match your environment.

4. Apply the configuration:
    ```sh
    terraform apply
    ```

5. Confirm the apply action with `yes`.

## Outputs

After applying the configuration, the following outputs will be available:
- Host Pool ID
- Session Host IDs
- Application Group IDs

## Cleanup

To destroy the resources created by this configuration:
```sh
terraform destroy
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss changes.

## License

This project is licensed under the MIT License.

## Troubleshooting

If you encounter any issues during the deployment, consider the following steps:

1. **Check Terraform Logs**: Review the Terraform logs for any error messages or warnings.
2. **Azure Portal**: Verify the resources in the Azure Portal to ensure they are created as expected.
3. **Network Configuration**: Ensure that the network configurations (Virtual Network, Subnets, NSGs) are correctly set up.
4. **Azure CLI**: Use Azure CLI commands to diagnose and troubleshoot issues with the deployed resources.

For further assistance, refer to the [Terraform documentation](https://www.terraform.io/docs/index.html) or the [Azure Virtual Desktop documentation](https://docs.microsoft.com/en-us/azure/virtual-desktop/).

## Support

If you need support, please open an issue in this repository or contact the maintainers.

## Acknowledgements

We would like to thank the contributors and the community for their support and contributions to this project.