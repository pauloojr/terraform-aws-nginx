data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "this" {
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

    user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install nginx -y

              cat > /usr/share/nginx/html/index.html <<HTML
              <!DOCTYPE html>
              <html>
              <head>
                <title>Terraform AWS Nginx</title>
              </head>
              <body>
                <h1>Terraform AWS Nginx</h1>
                <p>Infrastructure provisioned with Terraform.</p>
                <p>Environment: ${var.environment}</p>
              </body>
              </html>
              HTML

              systemctl enable nginx
              systemctl restart nginx
              EOF

  tags = {
    Name = "${var.environment}-nginx-ec2"
  }
}
