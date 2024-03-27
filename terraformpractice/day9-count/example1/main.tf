# Creating two instance with a same name
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myec2" {
  tags = {
    Name="ec2_instance_1.${count.index}"
  }
  ami = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name = "mykeypair11"
  count = 2
}
