# Déclaration de la ressource Key Pair pour la création d'une nouvelle paire de clés
resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file("${path.module}/sallby.pem.pub")
}

# Définition de la variable locale pour le chemin de la clé publique générée
locals {
  public_key_path = "${path.module}/sallby.pem.pub"
}


module "eks" {
  source                  = "./modules/eks"
  aws_public_subnet       = module.vpc.aws_public_subnet
  vpc_id                  = module.vpc.vpc_id
  cluster_name            = var.eks_cluster_name
  endpoint_public_access  = true
  endpoint_private_access = false
  public_access_cidrs     = ["0.0.0.0/0"]
  node_group_name         = var.node_group_name
  scaling_desired_size    = 1
  scaling_max_size        = 1
  scaling_min_size        = 1
  instance_types          = ["t3.small"]
  key_pair                = var.key_name
}

module "vpc" {
  source                  = "./modules/vpc"
  tags                    = var.tags
  instance_tenancy        = "default"
  vpc_cidr                = var.vpc_cidr_block
  access_ip               = "0.0.0.0/0"
  public_sn_count         = 2
  public_cidrs            = [var.subnet_cidr_block_a, var.subnet_cidr_block_b]
  map_public_ip_on_launch = true
  rt_route_cidr_block     = "0.0.0.0/0"

}

# Création du référentiel ECR
resource "aws_ecr_repository" "ecr" {
  name = var.container_registry_name
}
