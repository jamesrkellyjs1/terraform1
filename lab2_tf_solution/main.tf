resource "aws_instance" "lab" {
  ami = lookup(var.AMI, var.REGION)
  instance_type = var.INSTANCE_TYPE
  key_name = var.KEY_NAME
  tags = {
	Name = var.TAGS
  }
  security_groups = [aws_security_group.lab.name]
}

resource "aws_eip" "lab" {
  instance = aws_instance.lab.id
}

resource "aws_security_group" "lab" {
  name = var.SG_NAME
  description = var.SG_DESCRIPTION
  tags = {
	Name = var.TAGS
  }

  ingress {
    from_port = var.SG_PORT_SSH
    to_port = var.SG_PORT_SSH
    protocol = var.SG_PROTOCOL
    cidr_blocks = [var.SG_CIDR]
  }
  
  ingress {
    from_port = var.SG_PORT_HTTP
    to_port = var.SG_PORT_HTTP
    protocol = var.SG_PROTOCOL
    cidr_blocks = [var.SG_CIDR]
  }
  
  egress {
    from_port = var.SG_PORT_SSH
    to_port = var.SG_PORT_SSH
    protocol = var.SG_PROTOCOL
    cidr_blocks = [var.SG_CIDR]
  }
  
  egress {
    from_port = var.SG_PORT_HTTP
    to_port = var.SG_PORT_HTTP
    protocol = var.SG_PROTOCOL
    cidr_blocks = [var.SG_CIDR]
  }
}