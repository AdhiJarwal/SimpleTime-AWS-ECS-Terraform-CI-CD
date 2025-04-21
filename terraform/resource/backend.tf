terraform {
  backend "s3" {
    bucket         = "adhi-service"
    key            = "terraform/resource/terraform.tfstate"
    region         =var.aws_region
    encrypt        = true
    use_lockfile  = true               
    dynamodb_table = "adhi-service-table"
  }
}
