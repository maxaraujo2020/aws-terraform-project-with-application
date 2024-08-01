data "archive_file" "archive-file" {
  type        = "zip"
  source_file = "${path.module}/../functions/${var.function}"
  output_path = "outputs/${var.function}.zip"
}

resource "aws_lambda_function" "lambda-function" {
  function_name    = var.function_name
  description      = var.description
  filename         = data.archive_file.archive-file.output_path
  source_code_hash = data.archive_file.archive-file.output_base64sha256
  role             = var.role
  runtime          = "python3.9"
  handler          = "lambda_function.lambda_handler"
  timeout          = 10
  depends_on       = [data.archive_file.archive-file]
}
