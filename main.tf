terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ami" {
  owners = ["amazon"]
  most_recent = true

  dynamic "filter" {
    for_each = var.filters

    content {
      name = filter.key
      values = [filter.value]
    }
  }
}

resource "aws_instance" "simple_instance" {
  ami = data.aws_ami.ami.id
  instance_type = var.instance_type
}