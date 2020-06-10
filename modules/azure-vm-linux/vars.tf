variable "location" {
  description = "The Azure region in which this virtual machine will be deployed."
  type        = string
}

variable "name" {
  description = "The name to assign to the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this VM will be provisioned."
  type        = string
}

variable "network_interface_ids" {
  description = "The resource IDs of the network interfaces to attach to this virtual machine."
  type        = set(string)
}

variable "vm_size" {
  description = "The virtual machine instance size for this VM."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "delete_os_disk_on_termination" {
  description = "Whether or not the OS disk should be deleted when the VM is terminated."
  type        = bool
  default     = true
}

variable "delete_data_disks_on_termination" {
  description = "Whether or not the attached data disks should be deleted when the VM is terminated."
  type        = bool
  default     = false
}

variable "image_id" {
  description = "The ID of the image on which this VM will be based."
  type        = string
}

variable "os_disk_caching" {
  description = "Specifies the caching requirements for the OS disk. One of `None`, `ReadOnly`, or `ReadWrite`."
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_type" {
  description = "Specifies the type of managed disk to created. One of `Standard_LRS`, `StandardSSD_LRS`, `Premium_LRS`, or `UltraSSD_LRS`."
  type        = string
  default     = "Standard_LRS"
}

variable "disable_password_authentication" {
  description = "Specifies whether password authentication should be disabled. If set to `false` an `admin_password` must be specified, otherwise `ssh_keys` must be specified."
  type        = string
  default     = true
}

variable "ssh_keys" {
  description = "A set of SSH keys allowed to access the virtual machine."
  type = set(object({
    key_data = string
    path     = path
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the virtual machine."
  type        = map
  default     = {}
}
