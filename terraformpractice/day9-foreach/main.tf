variable "ami_id" {
  type = string
  default = "ami-0c101f26f147fa7fd"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
  default = "mykeypair11"
}
variable "for_each_loop" {
  type = list(string)
  default = [ "instanc1","instance2","instance3" ]
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myec2" {
  tags = {
    Name=each.value #for a set, each.value and each.key is the same
  }
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  for_each = toset(var.for_each_loop)
}