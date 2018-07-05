# Docker Image for a private Dokuwiki
A modified Docker image of the [Bitnami Dokuwiki image](https://github.com/bitnami/bitnami-docker-dokuwiki), meant for using Dokuwiki as a private wiki. Modifications include allowing for url rewriting via .htaccess and modifying robots.txt.
## Usage
```
docker pull jasonheecs/dokuwiki
```

Sample docker-compose file:

```yaml
version: '2'
services:
  dokuwiki:
    image: 'jasonheecs/dokuwiki:latest'
    labels:
      kompose.service.type: nodeport
    expose:
      - 80
    volumes:
      - '/bitnami:/bitnami'
```

## Url Rewriting
To enable [url rewriting](https://www.dokuwiki.org/rewrite), modify the AllowOverride directive at `/bitnami/apache/conf/vhosts/dokuwiki-vhost.conf`:

```
AddType application/x-httpd-php .php

<VirtualHost  127.0.0.1:80  _default_:80>
  ServerAlias *

  DocumentRoot /opt/bitnami/dokuwiki
  <Directory "/opt/bitnami/dokuwiki">
    Options -Indexes +FollowSymLinks -MultiViews
    AllowOverride All
    Require all granted
    DirectoryIndex index.html index.php


  </Directory>
  Include /opt/bitnami/apache/conf/vhosts/htaccess/dokuwiki-htaccess.conf
</VirtualHost>
```

Then enable the url rewriting option in the configuration manager as [documented on the wiki](https://www.dokuwiki.org/rewrite).

## Example wiki
https://wiki.jasonhee.com

## Docker Hub
[Docker Hub Link](https://hub.docker.com/r/jasonheecs/dokuwiki/)