terraform {
  backend "s3" {
    bucket = "mystatefile"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_endpoint = "mydynamic"
    encrypt = true
    
  }
}