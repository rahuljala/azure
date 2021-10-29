# Create a resource group if it doesn't exist
data "azurerm_resource_group" "myterraformgroup" {
    name     = "rr-rg-01"
    location = "eastus"

    tags = {
        environment = "Terraform Demo"
    }
}
# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
    name                = "rr-nsg-01"
    location            = "eastus"
    resource_group_name = data.azurerm_resource_group.myterraformgroup.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "Terraform Demo"
    }
}
