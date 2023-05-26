# Create Two Subnets of Frontend Tier

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet1-cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "1th Subnet"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet2-cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "2th Subnet"
  }
}

# Create Two Subnets of the Application Server 

resource "aws_subnet" "Application-Server-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet3-cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "1th app-Subnet"
  }
}

resource "aws_subnet" "Application-Server-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet4-cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = false

  tags = {
    Name = "2th app-Subnet"
  }
}

# Create Database Private Subnets

resource "aws_subnet" "database-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet5-cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "1th database-Subnet"
  }
}

resource "aws_subnet" "database-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet6-cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = false

  tags = {
    Name = "2th database-Subnet"
  }
}
