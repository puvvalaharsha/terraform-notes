module "mymain" {
    source = "./main-module"
    ami_id  = "ami-0d7a109bf30624c99"
    instance_type ="t2.micro"
    key_name="mykeypair11"
}