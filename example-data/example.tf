
data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "primary" {
}

data "azuread_group" "ad_group" {
  display_name     = var.group_display_name
  security_enabled = true
}


module "azure_role_assignment" {
  source               = "git::https://github.com/BrettOJ/tf-az-module-rbac-role-assignment?ref=main"
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.role_definition_name
  principal_id         = data.azuread_group.ad_group.object_id
}