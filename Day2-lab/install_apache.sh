#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl enable --now apache2
echo "<h1>Hello From Terraform</h1>" > /var/www/html/index.html
cat /var/www/html/index.html
curl http://localhost