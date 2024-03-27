resource "aws_instance" "myec2" {
    tags = {
      Name="myec2instance"
    }
    ami = data.aws_ami.myami.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.mysubnet.id
    security_groups = [ data.aws_security_group.mysq1.id ]
  
}