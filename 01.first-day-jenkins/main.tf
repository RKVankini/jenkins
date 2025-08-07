provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "name" {
    ami = "ami-0a1235697f4afa8a4"
    instance_type = "t2.micro"
    key_name = "RKV"
    tags = {
      Name = "through jenkins"
    }
}
