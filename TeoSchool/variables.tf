variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes"
  type        = string
  default     = "1.27"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "ID of the VPC for the EKS cluster"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for the EKS cluster"
  type        = map(string)
  default = {
    Environment = "Dev"
  }
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

variable "eks_cluster_role_arn" {
  description = "ARN du rôle IAM du cluster EKS"
  type        = string
  default     = "arn:aws:iam::123456789012:role/djiby-eks-cluster-role"
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

variable "availability_zone_a" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_cidr_block_b" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_b" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1b"
}

