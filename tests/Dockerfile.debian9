# Dockerfile for building image that contains software stack provisioned by Ansible.

FROM williamyeh/ansible:debian9-onbuild
MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Run playbook.
ENV PLAYBOOK setup.yml
RUN ansible-playbook-wrapper -v --extra-vars "php_owner=www-data php_group=www-data"

VOLUME [ "/data" ]
