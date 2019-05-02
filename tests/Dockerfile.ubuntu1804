# Dockerfile for building image that contains software stack provisioned by Ansible.
#
FROM williamyeh/ansible:ubuntu18.04-onbuild
MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# fix policy-rc.d for Docker
# @see http://www.monblocnotes.com/node/2057
# @see http://askubuntu.com/a/365912
RUN sed -i -e 's/exit\s\s*101/exit 0/' /usr/sbin/policy-rc.d

ENV PLAYBOOK setup.yml
RUN ansible-playbook-wrapper -v

VOLUME [ "/data" ]
