provider "aws" {
    region = "us-east-1"
}
data "aws_vpc" "vpc1" {
    filter {
      name = "tag:Name"
      values = [ "myvpc1" ]
    }
}
data "aws_subnet" "public_subnet" {
    filter {
      name = "tag:Name"
      values = [ "mypubsub" ]
    }
}
resource "aws_security_group" "security_group" {
    name = "my_sg1"
    vpc_id = data.aws_vpc.vpc1.id
    tags = {
      Name="mysg"
    }
    ingress {
        description = "allows ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]

    }
    ingress {
        description = "allows http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "allows all"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}


resource "aws_instance" "my_instance" {
    tags = {
      Name="myec2"
    }
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "mykeypair11"
    subnet_id = data.aws_subnet.public_subnet.id
  
}