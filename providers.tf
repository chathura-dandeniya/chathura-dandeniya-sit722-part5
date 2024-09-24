# Initializes Terraform providers and sets their version numbers.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.1"
    }
  }
  required_version = ">= 1.5.6"
}

# Configure the Azure Provider
provider "azurerm" {
  features {}

  # Use variables for sensitive values
  subscription_id = env.ARM_SUBSCRIPTION_ID
  client_id       = env.ARM_CLIENT_ID
  client_secret   = env.ARM_CLIENT_SECRET
  tenant_id       = env.ARM_TENANT_ID
}
