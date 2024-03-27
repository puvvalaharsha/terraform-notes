resource "aws_instance" "myec2" {
  ami = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  key_name = "mykeypair11"
  subnet_id = data.aws_subnet.mysubnet.id
  security_groups = [ data.aws_security_group.mysg.id ]
  tags = {
    Name="myec2"
  }

}