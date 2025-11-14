terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "demo-devops-pipeline-7six3nine3676-si"
  acl    = "private"
}
resource "aws_iam_policy" "example_policy" {
  name        = "example-policy"
  description = "Example IAM policy created with Terraform"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Resource = [
          "arn:aws:s3:::my-bucket",
          "arn:aws:s3:::my-bucket/*",
"arn:aws:s3:::your-bucket",
          "arn:aws:s3:::your-bucket/*"
        ]
      }
    ]
  })
}

