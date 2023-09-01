terraform {
  #  backend "s3" { /* see Makefile terraform/init for actual options */ }
  required_version = "~> 1.2.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "soudai-taki"
}
