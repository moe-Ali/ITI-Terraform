terraform {
  backend "s3" {
    bucket = "terraform-iti-backend-state"
    key    = "iti_project/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-iti-backend-locks"
  }
}