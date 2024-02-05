resource "aws_iam_policy" "lambda_write_to_cloudwatch_policy" {
    name_prefix = "${var.task1_name}-lambda-policy-"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:eu-west-2:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:*:*:*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role" "lambda_write_to_cloudwatch_role" {
    name_prefix =  "${var.task1_name}-lambda-log-role-"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}



EOF
  
}

resource "aws_iam_role_policy_attachment" "lambda_cloudwatch_attachement" {
    role = aws_iam_role.lambda_write_to_cloudwatch_role.name
    policy_arn = aws_iam_policy.lambda_write_to_cloudwatch_policy.arn
}