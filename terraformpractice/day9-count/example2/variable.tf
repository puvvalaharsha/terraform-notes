variable "ami_id" {
  type = string
  default = "ami-0c101f26f147fa7fd"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
  default = "mykeypair11"
}
variable "my_tages" {
  type = list(string)
  default = ["pub_instance","pvrt_instance"]
}
