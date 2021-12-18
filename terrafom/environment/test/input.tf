# Azure GUIDS
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# Resource Group/Location
variable "location" {}
variable "resource_group" {}
variable "application_type" {}
# Tags
variable tier {}
variable deployment {}

locals {  
  tags = {
      name = "course03_demo01"
  }  
}