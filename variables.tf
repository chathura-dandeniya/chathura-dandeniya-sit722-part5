# Sets global variables for this Terraform project.

variable "app_name" {
  description = "Name of the application or Kubernetes cluster"
  type        = string
  default     = "librarypart05"
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "eastus"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to be used for the cluster"
  type        = string
  default     = "1.30.3"
}

variable "ARM_SUBSCRIPTION_ID" {
  type        = string
  description = "Azure subscription ID"
}

variable "ARM_CLIENT_ID" {
  type        = string
  description = "Azure Client ID for authentication"
}

variable "ARM_CLIENT_SECRET" {
  type        = string
  description = "Azure Client Secret for authentication"
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  type        = string
  description = "Azure Tenant ID"
}
