# with numeric condition in third condition
# if ec2 instance = t2.micro only instance will create(count = var.instance_type == "t2.micro" ? 1 : 0) 
#but i am passing t2.nano so ec2 will not create
resource "aws_instance" "myec2" {
  tags = {
    Name=var.tags
  }
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  count = var.instance_type == "t2.micro" ? 1:0
}