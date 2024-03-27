resource "aws_instance" "myinstance" {
    ami="i-0cd0ae98d20d1d54e"
    instance_type = "t2.micro"
    key_name = "mykeypair11"
  
}