output "public" {
    value = aws_instance.myec2.public_ip
}
output "private" {
    value = aws_instance.myec2.private_ip 
}
