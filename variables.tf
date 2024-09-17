# Sets global variables for this Terraform project.

variable "app_name" {
  description = "Name of the application or Kubernetes cluster"
  type        = string
  default     = "libraryPart05"
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

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "client_id" {
  type        = string
  description = "Azure Client ID for authentication"
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret for authentication"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}
