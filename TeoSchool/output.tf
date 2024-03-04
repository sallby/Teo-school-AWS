output "eks_id" {
  value = aws_eks_cluster.eks.id
}
output "eks_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}
output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster_sg.id
}

output "eks_ca_cert" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

