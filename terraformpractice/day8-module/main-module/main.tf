provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "my_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "ec2"
    }

}