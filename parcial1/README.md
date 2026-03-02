# Primer Parcial — Servicios Telemáticos
**Universidad Autónoma de Occidente**

## Ambiente de trabajo
| VM | Hostname | IP | Rol |
|---|---|---|---|
| servidor | maestro.empresa.local | 192.168.50.3 | DNS Maestro + Apache |
| cliente | esclavo.empresa.local | 192.168.50.2 | DNS Esclavo |

## Estructura
- `parte1-dns/` — Configuración DNS Maestro/Esclavo con BIND9
- `parte2-apache/` — Apache con mod_deflate (compresión gzip)
- `parte3-ngrok/` — Túnel ngrok para exposición a internet

## Tecnologías
- BIND9, Apache2, mod_deflate, ngrok
- Vagrant + VirtualBox + Ubuntu 22.04
