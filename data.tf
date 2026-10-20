data "azurerm_storage_account" "storage_account" {
    for_each = var.containers
    name                 =each.value.name
    resource_group_name = each.value.resource_group_name
}
