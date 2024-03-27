variable "ami_id" {
  type = string
  default = "ami-0c101f26f147fa7fd"
}
variable "instance_type" {
  type = string
  default = "t2.nano"
}
variable "key_name" {
  type = string
  default = "mykeypair1"
}
variable "tags" {
  type = string
  default = "my_instance1"
}