resource "aws_ebs_volume" "ebs1" {
  availability_zone = "${var.region}a"
  size              = 20

  tags = {
    Name = "db1"
  }
}



resource "aws_volume_attachment" "ebs1_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs1.id
  instance_id = aws_db_instance.default.id
}
