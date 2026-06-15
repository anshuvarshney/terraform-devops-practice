resource "aws_security_group" "test-aws_security_group" {
    vpc_id = aws_vpc.test_vpc.id
#Inbound rules
    ingress {
     from_port = 80
     to_port = 80
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
    }

#Outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"   #applicable for all the protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

tags = {
  Name = "nginx-sg"
}
  
}