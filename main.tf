data "azurerm_storage_container" "storage_container" {
  name                 = "loan-documents"
  storage_account_name = "stlmsidndev001"
}

resource "azurerm_storage_container" "container" {
  for_each = var.containers
  name                  = each.value.name
# storage_container_id = data.azurerm_storage_container.storage_container[each.key].id
  container_access_type = each.value.container_access_type
}