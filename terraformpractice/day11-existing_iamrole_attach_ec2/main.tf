# Attache existing IAM role in AWS Console to ec2 instance local laptop
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myec2" {
    tags = {
      Name="instance1"
    }
    ami = "ami-0c101f26f147fa7fd"
    instance_type = "t2.micro"
    key_name = "mykeypair11"
    iam_instance_profile = data.aws_iam_instance_profile.existing_role.name
}
