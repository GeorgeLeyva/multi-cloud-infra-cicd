# This configuration intentionally defines no deployable resources.
# It exists to support Terraform validation and CI/CD planning workflows.

locals {
  naming_prefix = "cicd-${var.environment}"
}
# Azure Infrastructure Definitions (Plan-Only)

resource "azurerm_resource_group" "core" {
  name     = "${local.naming_prefix}-rg"
  location = var.location

  tags = {
    Environment = var.environment
    Owner       = "infra-team"
    ManagedBy   = "terraform"
  }
}


resource "azurerm_network_security_group" "core" {
  name                = "${local.naming_prefix}-nsg"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  security_rule {
    name                       = "Allow-HTTPS-Inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = var.environment
    Owner       = "infra-team"
  }
}


resource "azurerm_public_ip" "example" {
  name                = "${local.naming_prefix}-pip"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    Environment = var.environment
  }
}
