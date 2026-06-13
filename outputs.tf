output "aws_instance_public_ip" {
  value = aws_instance.web_server.public_ip
}
output "rand_id" {
  value = random_id.rand_id.b64_url
}