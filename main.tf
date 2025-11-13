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
  bucket = "demo-devops-pipeline-7six3nine3676-sims"
  acl    = "private"
}
