#!/bin/bash
sudo apt update
sudo apt install docker -y
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
systemctl daemon-reload
sudo service docker restart
docker run --rm --name abhinai -d -p 80:80 nginx