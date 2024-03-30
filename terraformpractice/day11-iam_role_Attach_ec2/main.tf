# Create IAM role and Ec2 instance and attach role to ec2 
provider "aws" {
  region = "us-east-1"
}
#step1 in AWS Console
# Creating IAM ROle
resource "aws_iam_role" "myrole" {
  name = "iam_role1"
  # Select trusted entities
  # AWS services, user case choosing ec2
  assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
  )
}
#step2 in AWS Console
# Creating iam policy and giving permission access to ec2 instance
resource "aws_iam_policy" "mypolicy" {
  name = "ec2_policy"
  # add permission access to ec2 instance
  policy = jsonencode(
    {
    Version: "2012-10-17",
    Statement: [
        {
            Action: "ec2:*",
            Effect: "Allow",
            Resource: "*"
        }
      ]
    }
    )
}
# Attach IAM policy to IAM role
resource "aws_iam_policy_attachment" "iam_policy_attach" {
  name = "mypolicy_attach"
  roles = [ aws_iam_role.myrole.name ]
  policy_arn = aws_iam_policy.mypolicy.arn
}
# Creating instance profile using role
resource "aws_iam_instance_profile" "myinstance_profile" {
  name = "instan_prof"
  role = aws_iam_role.myrole.name
}
#step3 ec2 instance and attach IAM Role
# Creating ec2 instance
resource "aws_instance" "myec2" {
  tags = {
    Name="pub_ec2"
  }
  ami = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name = "mykeypair11"
  # Attaching IAM ROLE to EC2 Instance
  iam_instance_profile = aws_iam_instance_profile.myinstance_profile.name
}
