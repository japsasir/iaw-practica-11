#!/bin/bash

###-------------------------------------------------------###
### Script para instalar WP-Scan en máquina AWS Ubuntu    ###
###-------------------------------------------------------###

## Variables ##
IP_PUBLICA=         # La IP del servidor que vamos a auditar.
API=                # API de WP-Scan. Puedes conseguirla registrándote en la Web.

# Instalamos curl.
sudo apt install curl
# Descargamos docker. La tubería a SH ejecuta los scripts necesarios para instalación automática.
sudo curl -fsSL https://get.docker.com | sh

## Recordatorio comandos del proceso docker ##
# sudo systemctl start docker
# sudo systemctl enable docker
# sudo systemctl status docker

# Descargamos la imagen de Docker. 'Docker images' nos permite ver la lista de imagenes
docker pull wpscanteam/wpscan

## Tres ejemplos de auditoria.

# Enumeración de plugin del sitio web.
echo examen 1/3: Lista de plugin.
docker run --rm wpscanteam/wpscan --url $IP_PUBLICA --enumerate p

# Examen sencillo. Descomentar 
echo examen 2/3: Examen sencillo.
docker run --rm wpscanteam/wpscan --url $IP_PUBLICA
# Examen en profundidad: Auditoría con token de Wpscan.
echo examen 3/3: Examen completo con token de la página web.
docker run --rm wpscanteam/wpscan --url $IP_PUBLICA --api-token $API
