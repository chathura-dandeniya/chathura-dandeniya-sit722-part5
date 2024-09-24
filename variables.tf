# Sets global variables for this Terraform project.

variable "app_name" {
  description = "Name of the application or Kubernetes cluster"
  type        = string
  default     = "librarypart05withterraform"
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
  description = "Azure subscription ID"
  type        = string
}

variable "ARM_CLIENT_ID" {
  description = "Azure Client ID for authentication"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "Azure Client Secret for authentication"
  sensitive   = true
  type        = string
}

variable "ARM_TENANT_ID" {
  description = "Azure Tenant ID"
  type        = string
}
