resource "azurerm_storage_account" "main" {
  name                     = "fedidstgaccount${var.environment}009"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}