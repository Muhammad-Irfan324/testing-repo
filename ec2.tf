locals {
  common_tags = {
    App       = "test"
    CreatedBy = "terraform"
  }
}

resource "aws_instance" "web_server" {
  depends_on                  = [aws_subnet.public_subnets, aws_security_group.main, aws_key_pair.generated]
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnets["public_subnet_1"].id
  security_groups             = [aws_security_group.main.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated.key_name
  connection {
    user        = "ubuntu"
    private_key = tls_private_key.generated.private_key_pem
    host        = self.public_ip
  }
  tags = merge({
    Name = "test-ec2-instance"
    }, local.common_tags
  )
  lifecycle {
    ignore_changes = [security_groups]
  }
}