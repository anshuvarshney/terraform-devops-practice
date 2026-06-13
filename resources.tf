resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.test_vpc.id
  tags = {
    Name = "public-sb"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.test_vpc.id
  tags = {
    Name = "private-vpc"
  }
}

resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "test-igw"
  }
}

resource "aws_route_table" "test-rt" {
  vpc_id = aws_vpc.test_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-igw.id
  }
  tags = {
    Name = "test-rt"
  }
}

resource "aws_route_table_association" "test-rt-association" {
  route_table_id = aws_route_table.test-rt.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_instance" "test-instace" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  user_data     = file("${path.module}/userdata.sh")
  vpc_security_group_ids = [ aws_security_group.test-aws_security_group.id ]
  associate_public_ip_address = true


}