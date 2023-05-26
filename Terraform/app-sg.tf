resource "aws_security_group" "app-sg" {
  name        = "allow traffic from&to web from&to database"
  description = ""
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "allows mysql port from anywhre"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "allows http from anywhre"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "allows ssh from anywhre"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }



  tags = {
    Name = "app-sg"
  }

}
