---
title: "Instalacion_mariadb_postgresql"
date: 2022-10-26T09:32:09+02:00
draft: true
---

```bash
sudo apt update 
sudo apt install mariadb-server 
sudo mysql_secure_installation 
```

```sql
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL ON *.* TO 'admin'@'localhost' WITH GRANT OPTION; 
FLUSH PRIVILEGES;  
EXIT
```
