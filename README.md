# Ansible Role: PHP 7 (PHP-FPM)

[![Build Status](https://travis-ci.org/chusiang/php7.ansible.role.svg?branch=master)](https://travis-ci.org/chusiang/php7.ansible.role) [![Release](https://img.shields.io/github/release/chusiang/php7.ansible.role.svg)](https://github.com/chusiang/php7.ansible.role/releases) [![Star](https://img.shields.io/github/stars/chusiang/php7.ansible.role.svg?style=flat&label=star)](https://github.com/chusiang/php7.ansible.role/stargazers) [![Fork](https://img.shields.io/github/forks/chusiang/php7.ansible.role.svg?style=flat&label=fork)](https://github.com/chusiang/php7.ansible.role/network) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/chusiang/php7.ansible.role/blob/master/LICENSE) [![Ansible Galaxy](https://img.shields.io/badge/role-php7-blue.svg)](https://galaxy.ansible.com/chusiang/php7/) [![Docker Hub](https://img.shields.io/badge/docker-php7-blue.svg)](https://hub.docker.com/r/chusiang/php7/) [![](https://images.microbadger.com/badges/image/chusiang/php7.svg)](https://microbadger.com/images/chusiang/php7 "Get your own image badge on microbadger.com")

An Ansible role of Deploy PHP 7 (php-fpm) for Nginx. (forked from [itcraftsmanpl.php7](https://galaxy.ansible.com/itcraftsmanpl/php7/))

* Current PHP7 version:

  * Debian & Ubuntu: **7.0.29**
  * CentOS: **7.0.28**

* Support Linux distributions:

  1. Ubuntu 16.04 (xenial)
  1. Ubuntu 14.04 (trusty)
  1. Debian 8 (jessie)
  1. Debian 9 (stretch)
  1. CentOS 6
  1. CentOS 7  

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```
#######
# All #
#######

# just for debug.
debug_mode: false

# allow_url_fopen
#   Default Value: On
php_allow_url_fopen: "Off"

php_disable_functions: "exec,passthru,shell_exec,system,proc_open,popen"
php_display_errors: "Off"
php_error_reporting: "E_ALL & ~E_DEPRECATED & ~E_STRICT"
php_memory_limit: "1024M"
php_opcache_enable: 1
php_opcache_revalidate_freq: 0
php_post_max_size: "20M"
php_serialize_precision: 17
php_session_cookie_httponly: 1
php_session_use_strict_mode: 1
php_soap_wsdl_cache_dir: '/php/cache/wsdl'
php_timezone: "Asia/Taipei"
php_upload_max_filesize: "20M"
php_upload_tmp_dir: "/php/cache/upload_tmp"

# Note: we need use 'www-data' on Debian 8.
php_owner: 'www-data'
php_group: 'www-data'

###################
# Debian & Ubuntu #
###################

debian_php7_apt_repo: "http://packages.dotdeb.org"
debian_php7_apt_key: "https://www.dotdeb.org/dotdeb.gpg"
ubuntu_php7_ppa_repo: "ppa:ondrej/php"

# A switch for use official apt repository.
#
#  true: use the official repository.
#  false: use the third-party repository.
apt_php_third_party_repo: true

apt_php_version: "7.0"
#apt_php_version: "7.1"

apt_php_packages:
  - php{{ apt_php_version }}
  - php{{ apt_php_version }}-cgi
  - php{{ apt_php_version }}-cli
  - php{{ apt_php_version }}-common
  - php{{ apt_php_version }}-curl
  - php{{ apt_php_version }}-fpm
  - php{{ apt_php_version }}-gd
  - php{{ apt_php_version }}-intl
  - php{{ apt_php_version }}-json
  - php{{ apt_php_version }}-mysql
  #- php{{ apt_php_version }}-pear

##########
# CentOS #
##########

yum_php_version: "70u"
#yum_php_version: "71w"

yum_php_packages:
  - php{{ yum_php_version }}-cli
  - php{{ yum_php_version }}-common
  - php{{ yum_php_version }}-fpm
  - php{{ yum_php_version }}-fpm-nginx
  - php{{ yum_php_version }}-json
  - php{{ yum_php_version }}-mysqlnd
  - php{{ yum_php_version }}-opcache
  - php{{ yum_php_version }}-pdo
 #- php{{ yum_php_version }}-mbstring
 #- php{{ yum_php_version }}-pear

# PHP-FPM FastCGI.
centos_php_fastcgi_listen: "/run/php-fpm/www.sock"
centos_nginx_fastcgi_server: "unix:{{ centos_php_fastcgi_listen }}"
```

### Note

1. If you see some error message, maybe you need modify `php_owner` and `php_group` from **nginx** to **www-data**.

   * Browser:

     > `An error occurred.`

   * error.log:

     > `connect() to unix:/var/run/php/php7.0-fpm.sock failed (13: Permission denied) while connecting to upstream ...`

1. The `/target/path/` of **socket**, configure files is difference on Ubuntu and CentOS. **Be careful your Nginx setting !**

   * Debian & Ubuntu:
     * Configure:
         * `/etc/php/7.0/fpm/php.ini`
         * `/etc/php/7.0/cli/php.ini`
     * Socket: `/var/run/php/php7.0-fpm.sock`

   * CentOS:
     * Configure:
         * `/etc/php-fpm.d/www.conf`
         * `/etc/php.ini`
     * Socket: `/run/php-fpm/www.sock`

1. We add `apt_php_third_party_repo `variable for enable or disable the third-party repository (after v1.3.6).

   * `true`: use the third-party repository.
   * `false`: use the debian / ubuntu official repository.

## Dependencies

None.

> If you need to setup nginx, you can use the [williamyeh.nginx](https://galaxy.ansible.com/williamyeh/nginx/) role.

## Example Playbook

    - hosts: webservers
      roles:
        - { role: chusiang.php7 }

## Docker Containers

This repository contains Dockerized [Ansible](https://github.com/ansible/ansible), published to the public [Docker Hub](https://hub.docker.com/) via **automated build** mechanism.

> Docker Hub: [chusiang/php7](https://hub.docker.com/r/chusiang/php7/)

### Images

* `chusiang/php7:ubuntu14.04` (lastest)
* `chusiang/php7:centos6`

### Usage

    $ docker run -it -v /src:/data chusiang/php7:ubuntu14.04 bash
    [root@a68e807eec8f tmp]# php -v
    PHP 7.0.7 (cli) (built: May 31 2016 11:36:12) ( NTS )
    Copyright (c) 1997-2016 The PHP Group
    Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
        with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
    
## License

MIT License (2015 - 2018). See the [LICENSE file](LICENSE) for details.

## Author Information

1. [itcraftsmanpl (Arkadiusz Kondas)](http://itcraftsman.pl/)
1. [chusiang (Chu-Siang Lai)](https://note.drx.tw)

