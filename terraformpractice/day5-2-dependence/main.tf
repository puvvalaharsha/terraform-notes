resource "aws_instance" "myec2" {
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "mykeypair11" 
    tags = {
      Name="myec25"
    }
}
resource "aws_s3_bucket" "bucket" {
    bucket = "mystatefile"
    depends_on = [ aws_instance.myec2 ]
}