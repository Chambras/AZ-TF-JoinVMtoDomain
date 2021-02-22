# Azure Join Windows VMs to a Domain

It shows how easy is to use Azure VM extensions in order to automatically join Windows VMs to a specific Domain.

It creates:

- A new Resource Group dedicated to VMs.
- A Windows VM.
- Security Groups.

## Project Structure

This project has the following files which make them easy to reuse, add or remove.

```ssh
├── LICENSE
├── README.md
├── main.tf
├── mainVar.tf
├── networking.tf
├── networkingVar.tf
├── outputs.tf
├── security.tf
├── securityVar.tf
├── storage.tf
├── storageVar.tf
├── vmVar.tf
├── winDevVM.tf
└── winDevVMVar.tf
```

## Pre-requisites

It is assumed that you have azure CLI installed and configured.
More information on this topic [here](https://docs.microsoft.com/en-us/azure/terraform/terraform-overview). I recommend using a Service Principal with a certificate for authentication specially if you are using this as part of your Ci/CD pipeline.

### versions

- Terraform 0.14.7
- AzureRM provider 2.48.0
- Azure CLI 2.19.1

## Networking and Storage

This project does not create any VNets or subnets. It assumes you already have that setup and that you also have a Domain controller and a service account. in summary this project assumes you already have the following:

- A main Resource Group where your VNet is located. You can set ip using the _`mainNetworkRG`_ variable in mainVar.tf
- A Vnet. You can set ip using the _`vnetName`_ variable in networkingVar.tf
- At least one subnet. You can set ip using the _`devSubnetName`_ variable in networkingVar.tf
- Storage account to store VM logs. You can set ip using the _`saName`_ variable in storageVar.tf

## VM Authentication

Windows authentication uses user name and password. It is not recommended setting these values in terraform scripts. You can set them as Environment variables. More information about this approach can be found [here](https://www.terraform.io/docs/configuration/variables.html#environment-variables).
These are the variables _vmUserName_ and _password_ that you should set up using this approach and they are also located in _`vmVar.tf`_ :

```ssh
export TF_VAR_vmUserName={{VMUSER}}
export TF_VAR_password={{VMPASSWORD}}
```

Starting with [terraform 0.14](https://www.hashicorp.com/blog/announcing-hashicorp-terraform-0-14-general-availability) you can also set all these credentials as sensitive. More information [here.](https://www.terraform.io/docs/configuration/expressions/references.html#sensitive-resource-attributes)

## Domain Authentication

In order to automatically join the Windows VM to a specific Windows Domain you need to have a service account with enough rights to create computer objects and add the VM to a specific organizational Unit ( OU ). These are the variables _`non_prod_ou`_, _`ldapbind_pw`_ and _`ldapbind_account`_ that you should set up using environment variable approach mentioned above and they are also located in _`vmVar.tf`_ :

```ssh
export TF_VAR_non_prod_ou={{OUPATH}}
export TF_VAR_ldapbind_account={{LADAPUSER}}
export TF_VAR_ldapbind_pw={{LADPASSWORD}}
```

## Usage

Just run these commands to initialize terraform, get a plan and approve it to apply it.

```ssh
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

I also recommend using a remote state instead of a local one. You can change this configuration in _`main.tf`_

You can create a free Terraform Cloud account [here](https://app.terraform.io).

## Clean resources

It will destroy everything that was created.

```ssh
terraform destroy --force
```

## Caution

Be aware that by running this script your account might get billed.

## Authors

- Marcelo Zambrana
