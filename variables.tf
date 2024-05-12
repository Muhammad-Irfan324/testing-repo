variable "backend_bucket_name" {
  description = "Bucket Name For Storing State File"
}

variable "dynamo_table_name" {
  description = "dynamo_table_name for implementing locking"
}

variable "aws_region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "private_subnets" {
  type = map(any)
}

variable "public_subnets" {
  type = map(any)
}

variable "web_ingress" {
  type = map(object(
    {
      description = string
      port        = number
      protocol    = string
      cidr_blocks = list(string)
    }
  ))
}

variable "web_egress" {
  type = map(object(
    {
      description = string
      port        = number
      protocol    = string
      cidr_blocks = list(string)
    }
  ))
}