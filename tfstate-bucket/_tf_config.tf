terraform {
  backend "local" {}
}

provider "aws" {
  region = "ap-northeast-1"
}
