

############################################################
# Dockerfile to build Python WSGI Application Containers
# 
# Based on Ubuntu LTS (trusty)
#
# - python2.7
# - python3.4
# - node0.10
# - zsh
# - vim
# - ssh
#
############################################################

FROM ubuntu:14.04
MAINTAINER Balazs Ree <ree@greenfinity.hu>
WORKDIR /root

RUN apt-get update
RUN apt-get install -y \
    software-properties-common python-software-properties \
    tar git curl wget dialog net-tools netcat build-essential \
    zsh vim openssh-server supervisor rsync \
    sudo screen htop ack-grep \
    python3-dev python-virtualenv \
    libcairo2-dev libjpeg8-dev libpango1.0-dev \
    libgif-dev build-essential g++
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
RUN npm install -g grunt-cli
RUN pip install virtualenv git-up

ADD /homeskel /root
ADD /homeskel /etc/skel
ADD /etc/supervisord.conf /etc/supervisor/conf.d/docker-ssh.conf
ADD /bin/docker-startup /usr/local/bin/docker-startup
RUN docker-startup
EXPOSE 22
EXPOSE 6543
CMD /usr/bin/supervisord
