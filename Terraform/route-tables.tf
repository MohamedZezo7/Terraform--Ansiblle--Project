# Create a public route table 

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# link the public route table to public Subnets

resource "aws_route_table_association" "rt1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route.id
}

# Create route table for Database and application instance to connect to bastian host

# bastion instance 1 (az-1)
resource "aws_route_table" "private-bastion-route1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.nat_instance1.id
  }
}

resource "aws_route_table_association" "app-subnet3" {
  subnet_id      = aws_subnet.Application-Server-1.id
  route_table_id = aws_route_table.private-bastion-route1.id
}

resource "aws_route_table_association" "db-subnet5" {
  subnet_id      = aws_subnet.database-1.id
  route_table_id = aws_route_table.private-bastion-route1.id
}

# bastion instance 1 (az-2)
resource "aws_route_table" "private-bastion-route2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.nat_instance2.id
  }
}
resource "aws_route_table_association" "app-subnet4" {
  subnet_id      = aws_subnet.Application-Server-2.id
  route_table_id = aws_route_table.private-bastion-route2.id
}

resource "aws_route_table_association" "db-subnet6" {
  subnet_id      = aws_subnet.database-2.id
  route_table_id = aws_route_table.private-bastion-route2.id
}

