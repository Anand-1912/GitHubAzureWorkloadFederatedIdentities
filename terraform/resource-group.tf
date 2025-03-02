resource "azurerm_resource_group" "main" {
  name     = "rg-fedid-${var.environment}"
  location = var.location
}