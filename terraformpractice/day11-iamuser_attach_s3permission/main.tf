# Create IAM user and attach s3 permission to that role
# Note when we are using iam user compulsory we should give ".name" for access
provider "aws" {
  region = "us-east-1"
  profile = "default"
}
# Creating iam user
resource "aws_iam_user" "myuser" {
  name = "harsha1"
}
# give the iam user programatic access
resource "aws_iam_access_key" "myaccess_key" {
 user= aws_iam_user.myuser.name 
}
# create the inline policy
# create the inline policy
data "aws_iam_policy_document" "s3_get_put_detele_policy_document" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]

    resources = [
      "arn:aws:s3:::s3fullaccess777/*"
    ]
  }
}
# attach the policy to the user
resource "aws_iam_user_policy" "myiam_user_policy" {
  name = "s3_get_put_delete"
  user = aws_iam_user.myuser.name
  policy = data.aws_iam_policy_document.s3_get_put_detele_policy_document.json
}