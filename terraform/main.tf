terraform {
  required_version = ">=1.8.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.46.0"
    }
  }
  backend "s3" {
    bucket  = "database-tfstate"
    region  = "ap-northeast-1"
  }
}