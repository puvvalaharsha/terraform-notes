# Creating multiple IAN user
resource "aws_iam_user" "myiam" {
  count = length(var.user_name)
  name = var.user_name[count.index]
}