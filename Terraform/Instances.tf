#create the two front end instance

resource "aws_instance" "web-instance1" {
  ami                         = var.webami
  instance_type               = var.web-instance-type
  subnet_id                   = aws_subnet.public-subnet-1.id
  tenancy                     = "default" # i determine it in vpc resource just for Confirm 
  key_name                    = "lab-key"
  vpc_security_group_ids      = ["${aws_security_group.web-sg.id}"]
  associate_public_ip_address = true # i determine it on subnet level just for confirm
  user_data                   = "sudo hostnamectl hostname frontend1"

  tags = {
    Name = "My Public Instance 1"
  }
}

resource "aws_instance" "web-instance2" {
  ami                         = var.webami
  instance_type               = var.web-instance-type
  subnet_id                   = aws_subnet.public-subnet-1.id
  tenancy                     = "default" # i determine it in vpc resource just for Confirm 
  key_name                    = "lab-key"
  vpc_security_group_ids      = ["${aws_security_group.web-sg.id}"]
  associate_public_ip_address = true # i determine it on subnet level just for confirm
  user_data                   = "sudo hostnamectl hostname frontend2"

  tags = {
    Name = "My Public Instance 2"
  }
}

#----------------------------------------------
# Create two backend instance 

resource "aws_instance" "app-instance1" {
  ami                         = var.appami
  instance_type               = var.app-instance-type
  subnet_id                   = aws_subnet.Application-Server-1.id
  tenancy                     = "default" # i determine it in vpc resource just for Confirm 
  key_name                    = "lab-key"
  vpc_security_group_ids      = ["${aws_security_group.app-sg.id}"]
  associate_public_ip_address = false # i determine it on subnet level just for confirm
  user_data                   = "sudo hostnamectl hostname APP1"

  tags = {
    Name = "My app Instance 1"
  }
}

resource "aws_instance" "app-instance2" {
  ami                         = var.appami
  instance_type               = var.app-instance-type
  subnet_id                   = aws_subnet.Application-Server-2.id
  tenancy                     = "default" # i determine it in vpc resource just for Confirm 
  key_name                    = "lab-key"
  vpc_security_group_ids      = ["${aws_security_group.app-sg.id}"]
  associate_public_ip_address = false # i determine it on subnet level just for confirm
  user_data                   = "sudo hostnamectl hostname APP2"

  tags = {
    Name = "My app Instance 2"
  }
}
#-----------------------------------------------------------------
# Create two database instances

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database-1.id, aws_subnet.database-2.id]
  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance-class
  multi_az               = true
  db_name                = var.db-name
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}

#---------------------------------------------------------------------------------------------------
#Create two Bastion instance to connect all instance in two different subnetsssssss
# nat instance in az-a
resource "aws_instance" "nat_instance1" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  key_name               = "lab-key"
  subnet_id              = aws_subnet.public-subnet-1.id
  source_dest_check      = false
  vpc_security_group_ids = ["aws_security_group.nat-sg.id"]

  tags = {
    Name = "nat-instance1"
  }
}
# nat instance in az-b
resource "aws_instance" "nat_instance2" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  key_name               = "lab-key"
  subnet_id              = aws_subnet.public-subnet-2.id
  source_dest_check      = false
  vpc_security_group_ids = ["aws_security_group.nat-sg.id"]

  tags = {
    Name = "nat-instance2(az-2)"
  }
}



