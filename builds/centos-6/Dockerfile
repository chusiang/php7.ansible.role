# Dockerfile for building image that contains software stack provisioned by Ansible.
#
# USAGE:
#   $ docker build -t php7 ../
#   $ docker run -d -v $(pwd):/data php7
#
# Version  1.2
#

# pull base image
FROM williamyeh/ansible:centos6-onbuild
MAINTAINER Chu-Siang Lai <chusiang.lai@gmail.com>

#
# build phase
#

# init.
RUN yum install -y curl git make ;\
      git clone https://github.com/chusiang/php7.ansible.role.git ;\
      cd php7.ansible.role ;\
      make init

ENV PLAYBOOK php7.ansible.role/setup.yml
RUN ansible-playbook-wrapper -vvv

VOLUME [ "/data" ]
