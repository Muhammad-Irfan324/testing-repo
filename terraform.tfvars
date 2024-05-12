backend_bucket_name = "remote-backend-state-file-with-encryption"
dynamo_table_name   = "terraform_dynamo_table_locking"
aws_region          = "us-east-1"
vpc_name            = "test-vpc"
vpc_cidr            = "10.0.0.0/16"
private_subnets = {
  "private_subnet_1" = 1
  "private_subnet_2" = 2
}
public_subnets = {
  "public_subnet_1" = 1
  "public_subnet_2" = 2
}
web_ingress = {
  "80" = {
    description = "Port 80"
    port        = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  "443" = {
    description = "Port 443"
    port        = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  "22" = {
    description = "Port 22"
    port        = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

web_egress = {
  "0" = {
    description = "ALL"
    port        = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}