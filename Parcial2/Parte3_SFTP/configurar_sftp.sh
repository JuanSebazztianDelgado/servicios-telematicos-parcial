
#!/bin/bash
# Parte 3 - SFTP + UFW
# Servidor: 192.168.50.3

# Verificar SSH activo
systemctl status sshd

# Verificar SFTP habilitado
grep -i sftp /etc/ssh/sshd_config

# Crear usuario SFTP
useradd -m sftpuser
echo "sftpuser:sftppass123" | chpasswd

# Verificar regla UFW puerto 22
ufw allow 22/tcp
ufw status verbose

echo "SFTP configurado correctamente"
