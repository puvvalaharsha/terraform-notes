# creating multiple instances with different name
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myec2" {
  tags = {
    Name= var.my_tages[count.index]
  }
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  count = length(var.my_tages)
}