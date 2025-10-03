# adding repository and installing nginx		
apt update
apt install nginx -y

cat <<EOT > vproapp
upstream vproapp {
  server app01:8080;
  server app02:8080;
}

server {
  listen 80;

  location / {
    proxy_pass http://vproapp;
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
  }
}

EOT

mv vproapp /etc/nginx/sites-available/vproapp
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp

#starting nginx service and firewall
systemctl start nginx
systemctl enable nginx
systemctl restart nginx
