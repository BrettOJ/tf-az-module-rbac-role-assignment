
data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "primary" {
}

module "azuread_group" {
  source           = "git::https://github.com/BrettOJ/tf-az-module-azuread-group?ref=main"
  display_name     = var.group_display_name
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = var.security_enabled
  members          = [data.azuread_client_config.current.object_id]
}


module "azure_role_assignment" {
  source               = "git::https://github.com/BrettOJ/tf-az-module-rbac-role-assignment?ref=main"
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.role_definition_name
  principal_id         = module.azuread_group.azuread_group_output.object_id
}