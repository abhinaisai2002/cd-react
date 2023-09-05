resource "aws_instance" "web" {

  depends_on = [ aws_vpc.main]
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  associate_public_ip_address = true

  user_data = file("./userdata.sh")

  key_name = "kalyan"
  
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  subnet_id = aws_subnet.main.id

  tags = {
    Name = "Docker"
  }
}

