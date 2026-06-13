terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create a VPC
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.test_vpc.id
  tags = {
    Name = "private_subent"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.test_vpc.id
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_internet_gateway" "test_internet_gateway" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "test-igw"
  }
}

resource "aws_route_table" "test-rt" {
  vpc_id = aws_vpc.test_vpc.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_internet_gateway.id
  }
  tags = {
    Name = "test-rt"
  }
}

resource "aws_route_table_association" "public_sub" {
  route_table_id = aws_route_table.test-rt.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_instance" "test-aws_instance" {
  ami = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  tags = {
    Name = "test-server"
  }
  subnet_id = aws_subnet.public_subnet.id
  
}