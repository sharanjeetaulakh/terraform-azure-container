
resource "azurerm_storage_container" "container" {
  for_each = var.containers
  name                  = each.value.name
    storage_account_id    = data.azurerm_storage_account.storage_container[each.key].id
  container_access_type = each.value.container_access_type
}
