---
title: "Ansible: Escenario router-nat"
date: 2022-10-18T13:49:56+02:00
draft: true
---
{{< alert "circle-info" >}}
Creación de un escenario con un cliente y un router-nat utilizando vagrant y ansible
{{< /alert >}}

## Vagrant

Según el esquema de red que tenemos que replicar, vamos a crear una **red muy aislada** entre las dos máquinas. También, el router tendrá un **bridge** que será su puerta de enlace predeterminada. En el caso del cliente, esta configuración se hará más adelante. El `Vagrantfile` queda de la siguiente manera:

{{< highlight ruby "linenos=table" >}}
  config.vm.define :router do |router|
    router.vm.box = "debian/bullseye64"
    router.vm.hostname = "router"
    router.vm.synced_folder ".", "/vagrant", disabled: true
    router.vm.network :public_network,
      :dev => "br0",
      :mode => "bridge",
      :type => "bridge",
      use_dhcp_assigned_default_route: true
    router.vm.network :private_network,
      :libvirt__network_name => "red-muy-aislada",
      :libvirt__dhcp_enabled => false,
      :ip => "192.168.0.1",
      :libvirt__forward_mode => "veryisolated"
  end
  config.vm.define :cliente do |cliente|
    cliente.vm.box = "debian/bullseye64"
    cliente.vm.hostname = "cliente"
    cliente.vm.synced_folder ".", "/vagrant", disabled: true
    cliente.vm.network :private_network,
      :libvirt__network_name => "red-muy-aislada",
      :libvirt__dhcp_enabled => false,
      :ip => "192.168.0.2",
      :libvirt__forward_mode => "veryisolated"
  end
end
{{< / highlight >}}

Creamos las máquinas virtuales:

```bash
vagrant up
```

## Ansible

Ahora nos movemos al directorio donde se va a encontrar el **playbook**. empezamos por el fichero `hosts`:

{{< highlight yaml "linenos=table" >}}
all:
  children:
    servidores_web:
      hosts:
        servidorWeb:
          ansible_ssh_host: 192.168.122.206
          ansible_ssh_user: usuario
          ansible_ssh_private_key_file: ~/.ssh/id_rsa
    servidores_bd:
      hosts:
        servidorDB: 
          ansible_ssh_host: 192.168.122.215
          ansible_ssh_user: usuario
          ansible_ssh_private_key_file: ~/.ssh/id_rsa
{{< / highlight >}}
