provider "aws" {
    region = "eu-west-1"  
}
provider "aws" {
  region = "us-east-1"
  alias = "mynewname"
}
resource "aws_s3_bucket" "bucket" {
    bucket = "jackharsha12"
  
}
resource "aws_s3_bucket" "mybucket" {
  bucket = "jonesharsha12"
  provider=aws.mynewname
}