provider "aws" {
  region = var.aws_region
}

# Création du VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Création de deux sous-réseaux dans des AZ différentes
resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_block_a
  availability_zone = var.availability_zone_a
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_block_b
  availability_zone = var.availability_zone_b
}

# Création du cluster EKS 
resource "aws_eks_cluster" "eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids         = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }

  tags = var.tags
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "eks_cluster_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "eks.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks_cluster_sg"
  description = "Security group for EKS cluster"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecr_repository" "ecr" {
  name = var.container_registry_name
}

resource "aws_iam_role_policy_attachment" "eks_ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_cluster_role.name
}
