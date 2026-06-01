#!/bin/bash

sudo apt update
sudo apt install -y vsftpd

sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

cat <<EOF | sudo tee /etc/vsftpd.conf
listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
pasv_min_port=40000
pasv_max_port=50000
EOF

sudo useradd -m ftpuser
echo "ftpuser:password123" | sudo chpasswd

sudo mkdir -p /home/ftpuser/ftp
sudo chown nobody:nogroup /home/ftpuser/ftp
sudo chmod a-w /home/ftpuser/ftp

sudo systemctl restart vsftpd
sudo systemctl enable vsftpd

echo "FTP Setup Completed. Service is running."
