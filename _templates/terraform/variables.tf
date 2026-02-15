variable "project_name" {
  description = "Project name — used in resource tags and naming"
  type        = string

  validation {
    condition     = length(var.project_name) > 0 && length(var.project_name) <= 32
    error_message = "project_name must be between 1 and 32 characters."
  }
}

variable "environment" {
  description = "Deployment environment: dev, staging, prod"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

# Add new variables using the same pattern:
# variable "name" {
#   description = "What this value is and why it exists"
#   type        = string / number / bool / list / map
#
#   validation {
#     condition     = <expression>
#     error_message = "Message shown when condition is false."
#   }
# }
