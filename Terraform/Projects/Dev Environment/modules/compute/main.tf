# EC2 instance

resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.web_server_kp.key_name
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  subnet_id              = var.subnet_id

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from ${var.project_name} - $(hostname -f)</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.project_name}-instance"
  }
}

# Key Pair

resource "tls_private_key" "web_server_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "web_server_kp" {
  key_name   = "server-kp"
  public_key = tls_private_key.web_server_key.public_key_openssh
}

resource "local_sensitive_file" "web_private_key_pem" {
  content         = tls_private_key.web_server_key.private_key_pem
  filename        = "./${var.project_name}-server-kp.pem"
  file_permission = "0400"
}

# Security Group

resource "aws_security_group" "allow_http" {
  name        = "${var.project_name}-allow_http"
  description = "Allow HTTP inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-allow_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_http_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_https_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_http_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = "80"
  ip_protocol       = "tcp"
  to_port           = "80"
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_https_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = "443"
  ip_protocol       = "tcp"
  to_port           = "443"
}