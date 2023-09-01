terraform {
  backend "local" {}
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "tfstate-bucket" {
  bucket = "isucon-provisioning-tfstate"
}