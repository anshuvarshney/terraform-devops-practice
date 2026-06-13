output "instance_public_ip" {
  value = aws_instance.test-instace.public_ip
}
output "instance_url" {
  value = "http://${aws_instance.test-instace.public_ip}"
}