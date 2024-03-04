variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "stdjiby"
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags for the AWS resources"
  type        = map(string)
  default = {
    Environment = "Dev"
  }
}
