# Dockerfile for building image that contains software stack provisioned by Ansible.
#
# USAGE:
#   $ docker build -t wordpress .
#   $ docker run -d -v $(pwd):/data wordpress
#
# Version  1.2
#

# pull base image
FROM williamyeh/ansible:centos6-onbuild
MAINTAINER Chu-Siang Lai <chusiang.lai@gmail.com>

#
# build phase
#
ENV PLAYBOOK setup.yml
RUN ansible-playbook-wrapper -v

VOLUME [ "/data" ]

