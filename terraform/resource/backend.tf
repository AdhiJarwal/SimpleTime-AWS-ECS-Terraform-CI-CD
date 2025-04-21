terraform {
  backend "s3" {
    bucket         = "adhi-service"
    key = "terraform/resource/terraform.tfstate"
    region         = "ap-south-1"                            
    dynamodb_table = "adhi-service-table"
    encrypt        = true                                   
  }
}
