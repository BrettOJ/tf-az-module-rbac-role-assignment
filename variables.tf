
variable "scope" {
  description = "The scope at which the role assignment should be created"
  type        = string
}

variable "role_definition_name" {
  description = "The name of the role definition to assign to the principal"
  type        = string
}

variable "principal_id" {
  description = "The ID of the principal to assign the role to"
  type        = string
}

