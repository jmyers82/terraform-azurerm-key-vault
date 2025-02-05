
resource "random_pet" "single" {
    length    = 1
}

resource "azurerm_resource_group" "hashitalks_kv_rg" {
  name     = "rg-hashitalks-${random_pet.single.id}"
  location = "Central US"
}

resource "azurerm_key_vault" "hashitalks_kv" {
  name                        = "kv-hashitalks-${random_pet.single.id}"
  location                    = azurerm_resource_group.hashitalks_kv_rg.location
  resource_group_name         = azurerm_resource_group.hashitalks_kv_rg.name
  tenant_id                   = data.azurerm_client_config.current_config.tenant_id
  sku_name                    = "standard"

  purge_protection_enabled    = true

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }
}


