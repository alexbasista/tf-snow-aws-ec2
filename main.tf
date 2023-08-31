provider "aws" {
  region = var.region
  default_tags = {
    Name = "SNOW Catalog demo"
  }
}

data "aws_ami" "ubuntu" {
  count = var.ami_id == null ? 1 : 0

  owners      = ["099720109477", "513442679011"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "snow_demo" {
  instance_type = var.instance_type
  ami           = var.ami_id == null ? data.aws_ami.ubuntu[0].id : var.ami_id

}