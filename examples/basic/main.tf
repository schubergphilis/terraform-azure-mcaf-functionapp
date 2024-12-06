terraform {
  required_version = ">= 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_msi = true
  msi_endpoint = "http://169.254.169.254/metadata/identity/oauth2/token"
}

module "function_app" {
  source = "../.."  # Adjust the path as required

  resource_group = {
    name     = "example-rg"
    location = "East US"
  }

  app_service_plan = {
    name = "example-asp"
    sku = {
      tier     = "Dynamic"
      size     = "Y1"
      capacity = 1
    }
  }

  function_app = {
    name                       = "example-func-app"
    storage_account_name       = "examplestoracct"
    storage_account_access_key = "example_storage_access_key"
    os_type                    = "linux"
    version                    = "~3"
    functions_worker_runtime   = "python"
    app_settings = {
      "APPINSIGHTS_INSTRUMENTATIONKEY" = "example_instrumentation_key"
    }
  }

  tags = {
    Environment = "Production"
  }
}