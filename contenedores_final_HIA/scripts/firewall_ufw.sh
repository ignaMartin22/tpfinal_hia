#!/bin/bash

echo "[+] Configurando firewall UFW..."

# Habilitar UFW si no está
sudo ufw --force enable

# Permitir solo lo necesario
sudo ufw allow 22/tcp      # SSH
sudo ufw allow 80/tcp      # HTTP
sudo ufw allow 443/tcp     # HTTPS
sudo ufw allow 3001/tcp    # Backend si viene desde afuera

# Bloquear TODO lo demás
sudo ufw default deny incoming  #Bloquea todo lo que no esta autorizado arriba
sudo ufw default allow outgoing  # Permite al sistema hacer conexiones salientes

echo "[+] Regla anti-port-scanning" # Bloquea el puerto 23 (Telnet) para evitar escaneos comunes
sudo ufw deny from 0.0.0.0/0 to any port 23 comment "Block Telnet scans"

echo "[+] Reglas aplicadas."
sudo ufw status verbose # Muestra el estado detallado de UFW
