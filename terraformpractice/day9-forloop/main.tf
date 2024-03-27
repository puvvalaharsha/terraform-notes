provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myec2" {
  tags = {
    Name="ec2_instance1"
  }
  ami = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name = "mykeypair11"
  root_block_device {
    #we can give custom value here 
    volume_size = 40
  }
}
resource "aws_security_group" "mysg" {
  name = "sg2"
  description = "Allow TLS inbound traffic"
  ingress= [
    for port in [22, 80, 443, 8080, 9000, 3000, 8082, 8081]:{
    description      = "inbound rules"
    from_port        = port
    to_port          = port
    protocol         = "tcp"
    cidr_blocks      =["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    }
]
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name ="sg2"
  }
}