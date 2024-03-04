variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "resource_group_location" {
  description = "Emplacement du groupe de ressources"
  type        = string
}

variable "account_tier" {
  description = "Sku du registre ACR"
  type        = string
  default     = "Standard"
}

variable "storage_account_name" {
  type        = string
  description = "The storage account name"
}

variable "tags" {
  description = "Étiquettes pour le cluster AKS"
  type        = map(string)
  default = {
    Environment = "Dev"
  }
}
