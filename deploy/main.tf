provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "web_server" {
    ami = "ami-0cf2b4e024cdb6960"
    instance_type = "t2.micro"
    key_name = "key"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My Web Server"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
  description = "The public IPv4 address of the web server instance"
}