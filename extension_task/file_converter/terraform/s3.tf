resource "aws_s3_bucket" "JSON_inbox" {
    bucket = "${var.lambda_name}-JSON-inbox"
}

resource "aws_s3_bucket" "parquet_output" {
    bucket = "${var.lambda_name}-parquet_output"
}

