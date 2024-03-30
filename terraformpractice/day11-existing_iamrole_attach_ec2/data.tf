data "aws_iam_instance_profile" "existing_role" {
  name = "jenkins" # here we should give exact Iam role name which is there in AWS Console

# Note:
# here we should give exact Iam role name which is in aws console
# if we give another name it will so error below indicating 
# reading IAM Instance Profile (jen): couldn't find resource
}