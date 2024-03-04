variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "TeoSchool-Djiby"
}

variable "resource_group_location" {
  description = "Emplacement du groupe de ressources"
  type        = string
  default     = "West Europe"
}

variable "container_registry_name" {
  description = "Nom du registre ACR"
  type        = string
  default     = "djibyACR"
}

variable "container_registry_sku" {
  description = "Sku du registre ACR"
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Activation de l'administration du registre ACR"
  type        = bool
  default     = true
}

variable "aks_cluster_name" {
  description = "Nom du cluster AKS"
  type        = string
  default     = "djibyAKSCluster"
}

variable "dns_prefix" {
  description = "Préfixe DNS du cluster AKS"
  type        = string
  default     = "djibyaksdns"
}

variable "kubernetes_version" {
  description = "Version de Kubernetes"
  type        = string
  default     = "1.28.0"
}

variable "node_count" {
  description = "Nombre de nœuds du pool par défaut"
  type        = number
  default     = 1
}

variable "node_size" {
  description = "Taille des nœuds du pool par défaut"
  type        = string
  default     = "Standard_B2s"
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
