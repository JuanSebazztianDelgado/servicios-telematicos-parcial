
#!/bin/bash
# Parte 2 - DNS sobre TLS (DoT)
# Cliente: 192.168.50.2

# Configurar resolved.conf
cat > /etc/systemd/resolved.conf << 'EOF'
[Resolve]
DNS=1.1.1.1 8.8.8.8
FallbackDNS=9.9.9.9 1.0.0.1
DNSOverTLS=yes
EOF

# Reiniciar servicio
systemctl restart systemd-resolved

# Forzar DoT en eth0
resolvectl dnsovertls eth0 yes
resolvectl dns eth0 1.1.1.1 8.8.8.8

# Verificar estado
resolvectl status

# Consultas de prueba
echo "=== Consultas DNS de prueba ==="
resolvectl query google.com
resolvectl query github.com
resolvectl query youtube.com

echo "DoT configurado correctamente"
