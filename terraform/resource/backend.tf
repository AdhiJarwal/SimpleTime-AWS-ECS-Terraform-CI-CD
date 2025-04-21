terraform {
  backend "s3" {
    bucket         = var.s3_bucket
    key            = "terraform/resource/terraform.tfstate"
    region         =var.aws_region
    encrypt        = true
    use_lockfile  = true               
    dynamodb_table = var.dynamodb_table
  }
}
