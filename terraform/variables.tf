variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes"
  type        = string
  default     = "1.28"
}

variable "tags" {
  description = "Tags for the EKS cluster"
  type        = string
  default     = "Dev"
}
variable "container_registry_name" {
  description = "Nom du registre de conteneurs"
  type        = string
  default     = "crdjiby"
}

variable "eks_cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
  default     = "djiby-eks-cluster"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block_a" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_block_b" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.2.0/24"
}
variable "node_group_name" {
  type    = string
  default = "djiby-node-group"
}
variable "key_name" {
  description = "Nom de la paire de clés EC2 pour accéder à l'instance"
  type        = string
  default     = "sallby"
}
