---
title: "Envío de alertas de Snort utilizando postfix"
date: 2022-10-14T13:53:06+02:00
draft: false
tags: ["postfix","snort"]
---
## Postfix
### Instalación
Antes de iniciar la instalación tenemos que comprobar el nombre de nuestra máquina, con el comando
```bash
$ hostname
```

Para instalar postfix previamente tenemos que instalar mailutils:
```bash
$ sudo apt update
$ sudo apt install mailutils
$ sudo apt install postfix
```
Tras la instalación de postfix, Se inciará un setup. En él seleccionamos *Internet site*, la opción por defecto. En el siguiente paso, si no está ya, introducimos el nombre de la máquina que consultamos antes. 

### Configuración

Una vez instalado, tenemos que editar varias líneas en el fichero de configuración: `/etc/postfix/main.cf`; tenemos que cambiar las siguientes líneas:
```bash
inet_interfaces = loopback-only
mydestination = $myhostname, localhost.$your_domain, $your_domain
```
Tras eso reiniciamos el servicio 
```bash
$ sudo systemctl restart postfix
```

Para comprobar que funciona podemos enviar un correo de prueba. Con la configuración actual, no podemos enviarlo a una dirección convencional (gmail, hotmail ...) ya que nuestra dirección de correo (usuario@hostname) no tiene un nombre de dominio completo (FQDM). Para el ejemplo, podemos enviarlo a un correo temporal como [este](https://temp-mail.org/es/).

Enviamos el correo con el siguiente comando:
```bash
$ echo "Cuerpo del mensaje" | mail -s "Asunto del mensaje" correoelectronico
```