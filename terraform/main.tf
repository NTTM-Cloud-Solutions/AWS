# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  profile = "default"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.0.0/24"
}

# Create a security group
resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    }
}
# Create RDS instance
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "foo"
  password             = "bar"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible  = true
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.example.id]
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0f673487d7e5f89ca"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id
  vpc_security_group_ids = [aws_security_group.example.id]
}

# Output the public IP
output "public_ip" {
  value = aws_instance.example.public_ip
}