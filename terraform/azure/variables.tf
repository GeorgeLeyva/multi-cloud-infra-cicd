variable "environment" {
  description = "Environment name (e.g. dev, test, prod)"
  type        = string
  default     = "demo"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus"
}
