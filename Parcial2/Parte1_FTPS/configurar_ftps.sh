
#!/bin/bash
# Parte 1 - Configuración FTPS + UFW
# Servidor: 192.168.50.3

# Configurar UFW
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 21/tcp
ufw allow 50000:50010/tcp
ufw enable

# Generar certificado SSL
mkdir -p /etc/ssl/vsftpd
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/vsftpd/servidor.key \
  -out /etc/ssl/vsftpd/servidor.crt \
  -subj "/C=CO/ST=Valle/L=Cali/O=UAO/CN=192.168.50.3"

# Instalar y configurar vsftpd
apt-get install -y vsftpd
cat > /etc/vsftpd.conf << 'EOF'
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
rsa_cert_file=/etc/ssl/vsftpd/servidor.crt
rsa_private_key_file=/etc/ssl/vsftpd/servidor.key
ssl_ciphers=HIGH
pasv_enable=YES
pasv_min_port=50000
pasv_max_port=50010
pasv_address=192.168.50.3
chroot_local_user=YES
allow_writeable_chroot=YES
ftpd_banner=Servidor FTPS UAO
EOF

systemctl restart vsftpd
systemctl enable vsftpd
echo "FTPS configurado correctamente"
