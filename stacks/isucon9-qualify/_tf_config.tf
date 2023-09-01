terraform {
  backend "s3" { /* see Makefile for actual options */ }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Name                  = "isucon"
      terraform             = "true"
      aws-nuke-donot-delete = "true"
    }
  }
}
