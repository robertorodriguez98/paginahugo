---
title: "Introducción"
date: 2022-10-10T12:54:33+02:00
draft: true
---
## Instalación
Antes de descargarlo, tenemos que instalar los prerrequisitos:
```bash
$ sudo apt install -y gcc libpcre3-dev zlib1g-dev libluajit-5.1-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet autoconf libtool
```
La versión de los repositorios de debian está un poco desactualizada. Vamos a descargarla de la página de snort:
```bash
$ mkdir snort_src && cd snort_src
$ wget https://github.com/snort3/snort3/archive/refs/tags/3.1.43.0.tar.gz
```
descomprimimos el fichero:
```bash
$ tar -xvzf 3.1.43.0.tar.gz
$ cd 3.1.43.0.tar.gz
```
