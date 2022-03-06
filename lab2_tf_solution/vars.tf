variable "ACCESS_KEY" {}
variable "SECRET_KEY" {}

variable "AMI" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0bb3fad3c0286ebd5"
    eu-west-2 = "ami-0a669382ea0feb73a"
  }
}

variable "REGION" {
  default = "eu-west-1"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "KEY_NAME" {
  default = "TU_Dublin"
}

variable "TAGS" {
  default = "Lab"
}

variable "SG_NAME" {
  default = "LabSecurityGroup"
}

variable "SG_DESCRIPTION" {
  default = "Allow SSH and HTTP"
}

variable "SG_PORT_SSH" {
  default = "22"
}

variable "SG_PORT_HTTP" {
  default = "80"
}

variable "SG_PROTOCOL" {
  default = "tcp"
}

variable "SG_CIDR" {
  default = "0.0.0.0/0"
}