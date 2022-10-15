terraform {
  backend "s3" { /* see Makefile for actual options */ }
}

provider "aws" {
  region = "ap-northeast-1"
}
