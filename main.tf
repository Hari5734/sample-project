# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used

//Teraform Bolck
terraform {
  required_version = "~>1.7.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

//Terraform state storage into Azure container

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "StorageAccount-ResourceGroup"
#     storage_account_name = "abcd1234"
#     container_name       = "tfstate"
#     key                  = "prod.terraform.tfstate"
#   }
# }


#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
provider "azurerm" {
  features {} 
#   client_id       = "00000000-0000-0000-0000-000000000000"
#   client_secret   = "20000000-0000-0000-0000-000000000000"
#   tenant_id       = "10000000-0000-0000-0000-000000000000"
#   subscription_id = "20000000-0000-0000-0000-000000000000"
}

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "tcs-rg"
    location = "eastus"
    tags      = {
        Environment = "Terraform Demo"
    }
}