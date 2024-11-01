variable "role_definition_name" {
  description = "The name of the role definition to assign to the principal"
  type        = string

}

variable "group_display_name" {
  description = "The display name of the Azure AD group"
  type        = string

}

variable "security_enabled" {
  description = "Whether the Azure AD group is security enabled"
  type        = bool
}


