variable "environment" {
  type        = string
  description = "The environment in which all resources will be created."
}


variable "location" {
  type        = string
  description = "The Azure Region in which all resources will be created."
  default     = "West Europe"
}