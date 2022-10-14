---
title: "Envío de alertas de Snort utilizando postfix"
date: 2022-10-14T13:53:06+02:00
draft: true
---
## Postfix
### Instalación
Antes de iniciar la instalación tenemos que comprobar el nombre de nuestra máquina, con el comando
```bash
hostname
```

Para instalar postfix previamente tenemos que instalar mailutils:
```bash
$ sudo apt update
$ sudo apt install mailutils
$ sudo apt install postfix
```
Tras la instalación de postfix, Se inciará un setup. En él seleccionamos *Internet site*, la opción por defecto. En el siguiente paso, si no está ya, introducimos el nombre de la máquina que consultamos antes. 

### Configuración

