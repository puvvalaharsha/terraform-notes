resource "aws_s3_bucket" "mybucket" {
    bucket = "mystatefile"
}
resource "aws_dynamodb_table" "dynamic_table" {
    name = "mydynamic"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
    attribute {
      name = "LockID"
      type = "S"
    }
  
}
