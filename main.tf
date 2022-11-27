resource "azurerm_role_definition" "role-def" {
  name = var.role_definition
  scope = var.subcription_id

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroup/read"
      "Microsoft.Resources/subscriptions/resourceGRoup/write"
    ]
    not_actions = []
  }

  assignable_scopes = {
    var.susbcription_id
  }
}

resource "azurerm_role_assignment" "role-assig" {
  scope = var.subscription_id
  role_definition_id = azurerm_role_definition.role-def.role_definition_resource_id
  principal_id = var.client_config_object_id
}

resource "azurerm_user_assigned_identity" "uai" {
  resource_group_name = var.resource_group_name
  location = var.resource_group_location
  name = var.uai_name
  
  tags = var.common_tags
}
