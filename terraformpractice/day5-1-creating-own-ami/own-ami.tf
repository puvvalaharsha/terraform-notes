provider "aws" {
  region = "us-east-1"
}
data "aws_ami" "myami" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


data "aws_security_group" "mysq1" {
    id = "sg-0a941038d7bdbe13f"
}
data "aws_subnet" "mysubnet" {
    id = "subnet-0fd93678c8eadd973"
}
