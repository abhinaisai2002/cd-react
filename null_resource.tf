resource "null_resource" "remote_execution" {
  # Define triggers to execute the provisioner only when specific changes occur.
  depends_on = [ aws_instance.web ]
  triggers = {
    always_run = "${timestamp()}"
  }

  # Connection settings for the target machine.
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_instance.web.public_ip
    private_key = file("./kalyan.pem")
  }

  # Provisioner block to define remote execution steps.
  provisioner "remote-exec" {
    inline = [
      "/usr/bin/docker --version",
      "export PATH=$PATH:/usr/bin",
      "docker ps | grep abhinai && docker stop abhinai",
      "docker pull abhinai02/ci-cd:latest",
      "docker run --rm --name abhinai -d -p 80:80 abhinai02/ci-cd:latest"
    ]
  }
}
