#!/bin/bash
sudo apt update -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh 
sudo usermod -aG docker ubuntu
systemctl daemon-reload
sudo service docker restart
docker run --rm --name abhinai -d -p 80:80 nginx