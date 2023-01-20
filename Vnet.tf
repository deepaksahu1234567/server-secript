resource "aws_vpc" "myVPC" {
 cidr_block = "10.0.0.0/16"
 instance_tenancy = "default"
 enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   ="false"
  tags={
     Name = "myVPC"
}
}
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1e"

  tags = {
    Name = "dev-public-1"
  }
}
resource "aws_subnet" "dev-private-1" {
  vpc_id                  = aws_vpc.myVPC.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1e"

  tags = {
    Name = "dev-private-1"
  }
}


resource "aws_route_table" "dev-public" {
  vpc_id = aws_vpc.myVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }
tags = {
    Name = "dev-public-1"
  }
}


resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id      = aws_subnet.dev-public-1.id
  route_table_id = aws_route_table.dev-public.id
}
resource "aws_eip" "nat" {
  vpc = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.dev-public-1.id
  depends_on    = [aws_internet_gateway.dev-gw]
}
resource "aws_route_table" "dev-private" {
  vpc_id = aws_vpc.myVPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "dev-private-1"
  }
}


resource "aws_route_table_association" "dev-private-1-a" {
  subnet_id      = aws_subnet.dev-private-1.id
  route_table_id = aws_route_table.dev-private.id
}



resource "aws_security_group" "allow_ssh"{
  description = "Allow limited inbound external traffic"
  vpc_id = aws_vpc.myVPC.id
  name = "allow_ssh_sg"

 ingress{
 protocol = "tcp"
 cidr_blocks =["0.0.0.0/0"]
 from_port = 22
 to_port = 22
 }

 ingress{
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
   from_port = 8080
  to_port  = 8080
}

 ingress{
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 443
  to_port  = 443
 }

 egress {
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 0
  to_port = 0
}

 tags = {
  Name = "allow_ssh_sg"
}
}

 output "aws_security_group_id" {
    value = "aws_security_group.aws_security_group_id"
}

resource "aws_instance" "public_instan" {
   ami            = "ami-00874d747dde814fa"
   instance_type = "t2.micro"
   vpc_security_group_ids= [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.dev-public-1.id
  key_name = "project"
  count = 1
  associate_public_ip_address = true
  tags = {
  Name = "public_instance"
  }
}

resource "aws_instance" "private_instan"{
 ami = "ami-00874d747dde814fa"
 instance_type = "t2.micro"
 vpc_security_group_ids= [ aws_security_group.allow_ssh.id ]
 subnet_id = aws_subnet.dev-private-1.id
   key_name = "project"
 count = 1
 associate_public_ip_address = false
 tags = {
 Name = "private_instance"
 }
}

