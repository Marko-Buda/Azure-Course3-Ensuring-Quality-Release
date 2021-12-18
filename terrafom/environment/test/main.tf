provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "tfstate4656"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key           = "2vAgww8FmMkmLgp1gNnqt6HnCGLCQRhw4Vf6wrCxHP9qEi/q9JO/NH7x5lH42/YY0dBnxz66JDNAxis7sthXEA=="
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}

module "app_service" {
  source               = "../../modules/appservice"
  location             = "${var.location}"
  resource_type        = "AppService"
  resource_group       = "${module.resource_group.resource_group_name}"
  application_type     = "${var.application_type}"
  tags                 = "${local.tags}"
}
