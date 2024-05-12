resource "aws_ecr_repository" "wkdchtgpt_ecr_repo" {
  name                 = "node-application-ecr"
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name = "node-application-ecr"
  }
}
