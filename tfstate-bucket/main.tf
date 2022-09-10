resource "aws_s3_bucket" "tfstate-bucket" {
  bucket = local.Name
}