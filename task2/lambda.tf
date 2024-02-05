resource "aws_lambda_function" "demo_lambda" {
    filename = "demo_function_payload.zip"
    function_name = "${var.task1_name}"
    role = aws_iam_role.lambda_write_to_cloudwatch_role.arn
    handler = "demo.handler"
    runtime = "python3.11"

}

data "archive_file" "lambda"{
    type = "zip"
    source_file = "demo.py"
    output_path = "demo_function_payload.zip"
} 
