resource "aws_cloudwatch_log_group" "create_cloudwatch_log_group" {
  name = "/aws/lambda/${var.lambda_name}"
}
resource "aws_cloudwatch_log_metric_filter" "invalid_file_type_error" {
  name           = "invalid file type error"
  pattern        = "is not a valid text file"
  log_group_name = aws_cloudwatch_log_group.create_cloudwatch_log_group.name

  metric_transformation {
    name      = "InvalidFileEventCount"
    namespace = "s3-file-reader-errors"
    value     = "1"
  }
}
resource "aws_cloudwatch_metric_alarm" "s3_reader_invalid_file_error" {
  alarm_name          = "s3-reader-invalid-file-error"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.invalid_file_type_error.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.invalid_file_type_error.metric_transformation[0].namespace
  period              = 30
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "This metric monitors invalie file type errors from s3 file reader"
  alarm_actions       = ["arn:aws:sns:eu-west-2:992382553944:test-error-alerts"]


}
resource "aws_cloudwatch_log_metric_filter" "unicode_error" {
  name           = "unicode error"
  pattern        = "is not a valid text file"
  log_group_name = aws_cloudwatch_log_group.create_cloudwatch_log_group.name

  metric_transformation {
    name      = "EventCount"
    namespace = "s3-file-reader-errors"
    value     = "1"
  }
}
resource "aws_cloudwatch_metric_alarm" "s3_reader_unicode_error" {
  alarm_name          = "s3-reader-unicode-error"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.unicode_error.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.unicode_error.metric_transformation[0].namespace
  period              = 30
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "This metric monitors unicode errors from s3 file reader"
  alarm_actions       = ["arn:aws:sns:eu-west-2:992382553944:test-error-alerts"]


}
