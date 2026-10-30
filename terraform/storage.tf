resource "azurerm_storage_account" "blob" {
  name                     = "aireviewblobdemo0109x"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = false
}

resource "azurerm_storage_container" "blob" {
  name                  = "documents"
  storage_account_id    = azurerm_storage_account.blob.id
  container_access_type = "private"
}

# resource "azurerm_private_endpoint" "block_storage" {
#   name                = "pe-blobfather-block"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   subnet_id           = azurerm_subnet.subnet.id

#   private_service_connection {
#     name                           = "psc-blobfather-block"
#     private_connection_resource_id = azurerm_storage_account.block_storage.id
#     subresource_names              = ["blob"]
#     is_manual_connection           = false
#   }
# }
