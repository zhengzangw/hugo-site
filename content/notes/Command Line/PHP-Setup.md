---
title: "Setup: PHP"
date: 2018-12-30
tags: [php, config]
weight: 30
---

# Set up VM

```bash
sudo apt update
adduser newuser
usermod -aG sudo newuser
sudo nano /etc/ssh/sshd_config
# change PasswordAuthentication from no to yes (Afterwards you can change it back)
sudo systemctl restart sshd
ssh-keygen -f .ssh/id_rsa_new # local
ssh-copy-id newuser@server #local, and edit .ssh/config
sudo apt install curl git unzip build-essential
```

<!--more-->

# Set up Apache

```bash
sudo apt install apache2
sudo apache2ctl configtest
sudo nano /etc/apache2/apache2.conf
# change ServerName -domain-
sudo apache2ctl configtest
sudo systemctl restart apache2
#sudo ufw app list
#sudo ufw app info "Apache Full"
#sudo ufw allow in "Apache Full"
```

# Set up Apache Virtual Hosts

```bash
sudo mkdir -p /var/www/domain.com/
sudo mkdir -p /var/www/test.domain.com/
sudo chown -R $USER:$USER /var/www/domain.com
sudo chown -R $USER:$USER /var/www/test.domain.com
sudo chmod -R 755 /var/www
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/domain.com.conf
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/domain.com.conf
# change ServerAdmin,DocumentRoot, add ServerName domain.com, ServaerAlias www.domain.com
sudo a2ensite domain.com.conf
sudo a2ensite test.domain.com.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
```

# Set up TLS/SSL certificate

```bash
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install python-certbot-apache
sudo certbot --apache -d domain.com -d test.domain.com
# https://www.ssllabs.com/ssltest/analyze.html?d=domain.com&latest
# sudo certbot renew --dry-run
```

# Set up MySQL

```bash
sudo apt-get install mysql-server
mysql_secure_installation
```

# Set up PHP

```bash
sudo apt-get install php libapache2-mod-php  php-mysql
sudo nano /etc/apache2/mods-enabled/dir.conf
# change the position
sudo systemctl restart apache2
# sudo systemctl status apache2
```

# Set up phpMyadmin

```bash
sudo apt install phpmyadmin php-mbstring php-gettext php-cli
sudo phpenmod mbstring
sudo systemctl restart apache2
sudo mysql
# mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
# FLUSH PRIVILEGES;
# Above Enable root to log in
# CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
# GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
# Above create a new user
sudo ln -s /usr/share/phpmyadmin /var/www/domain/
```

# Set up Composer

```bash
curl -sS https://getcomposer.org/installer -o composer-setup.php
export HASH=# SHA value from https://composer.github.io/pubkeys.html
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

To use Composer:

* Search on [packagist](https://packagist.org)
* `composer require vendor/package`
* Or add in composer.json and run `composer install`
* in php file, require vendor/autoload.php

# Use PHPmailer

See following tutorials:
* [PHPMailer](https://github.com/PHPMailer/PHPMailer)
* [phpmailer](https://edu.unethost.com/主機相關/phpmailer-運用gmail來寄信2/)
