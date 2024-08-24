terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
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
