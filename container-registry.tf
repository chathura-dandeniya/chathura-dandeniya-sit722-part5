#
# Creates a container registry on Azure so that you can publish your Docker images.
#
resource "azurerm_container_registry" "container_registry" {
  name                = var.app_name
  resource_group_name = "deakinuni"
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}

output "registry_username" {
  value = azurerm_container_registry.container_registry.admin_username
}

output "registry_password" {
  value = azurerm_container_registry.container_registry.admin_password
}

output "registry_login_server" {
  value = azurerm_container_registry.container_registry.login_server
}

