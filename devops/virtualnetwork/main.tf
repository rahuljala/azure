data "azurerm_resource_group" "myterraformgroup" {
    name     = "rr-rg-01"
    location = "eastus"

    tags = {
        environment = "Terraform Demo"
    }
}
# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "rr-vnet-01"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = data.azurerm_resource_group.myterraformgroup.name
    tags = {
        environment = "Terraform Demo"
    }
}
# Create subnet
resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "rr-snet-01"
    resource_group_name  = data.azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["10.0.1.0/24"]
}