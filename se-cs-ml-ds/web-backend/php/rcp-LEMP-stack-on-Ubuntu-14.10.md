**How to set up a basic Linux, Nginx, MySQL, PHP stack on Ubuntu Linux (14.10 x86_64)**

---

## Nginx

```
sudo apt-get install nginx
```

## MySQL

```
sudo apt-get install mysql-server
sudo mysql_install_db
sudo mysql_secure_installation
```

## PHP 5 (5.5)

**Note:** DO NOT install the package simply named `php5`, because on this Ubuntu version it drags in Apache 2 as a dependency and you probably don't want that, and it'l also terribly outdated.

```
sudo apt-get install php5-cli php5-fpm php5-mysqlnd
sudo apt-get install php5-curl php5-gd php5-mcrypt php5-sqlite
```

For development machines only (NEVER use XDebug on production servers!):

```
sudo apt-get install php5-xdebug
```

### Managing PHP modules

Listing all installed modules:

`ls /etc/php5/mods-avaialable/`

Listing enabled modules:

```
ls -l /etc/php5/fpm/conf.d/
ls -l /etc/php5/cli/conf.d/
```

Enabling modules:

`sudo php5enmod -s ALL|fpm|cli|... module1_name module2_name ...`

...or create the symlink manually.

Disabling modules:

``sudo php5dismod -s ALL|fpm|cli|... module1_name module2_name ...`

...or remove the symlink manually.

### Sample usable XDebug config

```
zend_extension=xdebug.so
xdebug.remote_enable=1
;xdebug.remote_autostart=1
xdebug.remote_connect_back=1
xdebug.remote_handler=dbgp
xdebug.remote_mode=req
xdebug.remote_host=127.0.0.1
xdebug.remote_port=9000
xdebug.idekey=default
```

## Nginx config

This should be a useful starting point, but don't take it as is...

```
server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /usr/share/nginx/html;
    index index.php index.html index.htm;

    server_name server_domain_name_or_IP;

    # Compression
    gzip on;
    gzip_proxied any;
    gzip_types text/plain text/xml text/css application/x-javascript text/javascript application/javascript;
    gzip_vary on;

    # Cache expiry header - you'll need it for a decent pagespeed score
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|ttf|otf)(\?ver=[0-9.]+)?$ {
        expires 1y;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    # This is whay you'd use for Laravel
    #location / {
    #    index index.php index.html;
    #    try_files $uri /index.php$uri?$args;
    #}

    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    # WARNING: this rule could cause problems in some cases, take care!
    # Remove trailing slash to please routing system.
    #if (!-d $request_filename) {
    #    rewrite     ^/((?!index.php).+)/$ /$1 permanent;
    #}
}
```

## PHPMyAdmin

```
sudo apt-get install phpmyadmin
sudo ln -s /usr/share/phpmyadmin /usr/share/nginx/html
sudo php5enmod -s ALL mcrypt
```

## Composer (if you want it globally)

```
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

## PHPUnit (globally)

**Note:** DO NOT install the distro package `composer` bacause it might drag in `apache2` as a dependency and it's also very outdated.

```
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit
phpunit --version
```