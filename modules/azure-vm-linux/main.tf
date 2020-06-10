# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY AN AZURE VIRTUAL MACHINE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12"
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.network_interface_ids
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  storage_image_reference {
    id = var.image_id
  }

  storage_os_disk {
    name              = "${var.name}--os-disk"
    caching           = var.os_disk_caching
    create_option     = "FromImage"
    managed_disk_type = var.os_disk_type
  }

  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
  }

  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys                        = var.ssh_keys
  }

  tags = var.tags
}
