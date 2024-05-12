output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}
output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}
output "vpc_id" {
  description = "Output the ID for the primary VPC"
  value       = aws_vpc.vpc.id
}
output "ubuntu-ami-id" {
  description = "ubuntu-ami-id"
  value       = data.aws_ami.ubuntu.image_id
}
output "ec2_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.web_server.public_ip
}