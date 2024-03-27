provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myin" {
    tags = {
      Name="myinstance"
    }
    ami="ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "mykeypair11"
    user_data = file("script.sh")
  
}