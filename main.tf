resource "aws_instance" "web_server" {
  ami = "ami-0db56f446d44f2f09"
  instance_type = "t2.micro"

  tags = {
    Name = "test-server"
  }
  
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "demo-bucket-tf693-${random_id.rand_id.hex}"
  
}

resource "aws_s3_object" "test_object" {
  bucket = aws_s3_bucket.demo_bucket.bucket
  source =  "./myfile.html"
  key = "myfile.html"
}
