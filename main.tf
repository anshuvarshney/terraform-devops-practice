resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket-trackfundai"

}

resource "aws_s3_object" "s3_object" {
  bucket = aws_s3_bucket.test_bucket.bucket
  key = "./index.html"
  source = "./index.html"
  content_type = "text/html"

}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.test_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.test_bucket.id
 policy = jsonencode({
  Version = "2012-10-17"

  Statement = [
    {
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"

      Action = [
        "s3:GetObject"
      ]

      Resource = [
        "arn:aws:s3:::${aws_s3_bucket.test_bucket.id}/*"
      ]
    }
  ]
})
}

resource "aws_s3_bucket_website_configuration" "webserver" {
  bucket = aws_s3_bucket.test_bucket.id

  index_document {
    suffix = "index.html"
  }

 

  
}