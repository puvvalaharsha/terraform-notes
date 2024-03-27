variable "user_name" {
  description = "IAM usernames"  
  type = list(string)
  default = [ "iam_user1","iam_user2","iam_user3" ]
}