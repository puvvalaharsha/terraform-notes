data "aws_security_group" "mysg" {
    id = "sg-032d3c512fba190fa"  
}
data "aws_subnet" "mysubnet" {
  id = "subnet-09a72de804d68ab9c"
}