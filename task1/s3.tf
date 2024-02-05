resource "aws_s3_bucket" "demo_bucket" {
  # TO BE IMPLEMENTED
  bucket_prefix = "${var.task1_name}-s3-"
  tags = {
    Name        = "terraform demo"
    Environment = "test"
    CreatedBy   = "James Ault"
  }
}

resource "aws_s3_object" "demo_object" {
  bucket = aws_s3_bucket.demo_bucket.bucket
  key = "test_file.txt"
  source = "test_file.txt"
}


