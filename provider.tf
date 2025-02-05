provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                 = var.subscription_id
  features {}
}


data "azurerm_client_config" "current_config" {}
