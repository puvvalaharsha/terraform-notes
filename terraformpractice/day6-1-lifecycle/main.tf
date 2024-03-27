provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myin" {
    tags = {
      Name="myinstance"
    }
    ami="ami-0d7a109bf30624c99"
    subnet_id = "subnet-09a72de804d68ab9c"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "mykeypair11"
   
#below examples are for lifecycle meta_arguments 
   #lifecycle {
   #  create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
   #}

 #lifecycle {
  # prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
 #}


  #lifecycle {
  #ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
 # }
}