resource "azurerm_storage_account" "example" {
  name                     = "examplestorageacct"
  resource_group_name       = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type = "LRS"

  # Misconfiguration: Public access is not restricted; all networks allowed
  network_rules {
    default_action = "Allow"  # This should be "Deny" to restrict all public access
  }

  tags = {
    environment = "production"
  }
}