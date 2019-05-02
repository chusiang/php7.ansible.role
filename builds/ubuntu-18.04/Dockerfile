# Dockerfile for building image that contains software stack provisioned by Ansible.

FROM williamyeh/ansible:ubuntu18.04-onbuild
MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# @see http://www.monblocnotes.com/node/2057
# @see http://askubuntu.com/a/365912
RUN echo "===> Fix policy-rc.d for Docker ..."  && \
      sed -i -e 's/exit\s\s*101/exit 0/' /usr/sbin/policy-rc.d

RUN echo "===> Install necessary packages ..."  && \
      apt-get install -y curl git make

RUN echo "===> Get playbook ..."  && \
      git clone --depth=1 https://github.com/chusiang/php7.ansible.role.git ;\
      cd php7.ansible.role

ENV PLAYBOOK php7.ansible.role/setup.yml

RUN echo "===> Run playbook ..."  && \
      ansible-playbook-wrapper

# Run service.
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

WORKDIR /srv

CMD [ "php", "--version" ]
