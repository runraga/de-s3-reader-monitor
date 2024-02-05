resource "aws_lambda_function" "s3_file_reader" {
# TO BE IMPLEMENTED
  s3_bucket = aws_s3_bucket.code_bucket.bucket
  s3_key = aws_s3_object.lambda_code.key
  function_name = "${var.lambda_name}"
  role = aws_iam_role.lambda_role.arn
  runtime = "python3.11"
  handler = "reader.lambda_handler"
  depends_on = [ aws_cloudwatch_log_group.create_cloudwatch_log_group ]
}

resource "aws_lambda_permission" "allow_s3" {
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_file_reader.function_name
  principal = "s3.amazonaws.com"
  source_arn = aws_s3_bucket.data_bucket.arn
  source_account = data.aws_caller_identity.current.account_id
}