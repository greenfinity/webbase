

############################################################
# Dockerfile to build Python WSGI Application Containers
# 
# Based on Ubuntu LTS (precise)
#
# - python2.7
# - python3.4
# - node0.10
# - zsh
# - vim
# - ssh
#
############################################################

FROM ubuntu:12.04
MAINTAINER Balazs Ree <ree@greenfinity.hu>
WORKDIR /root

# RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise main universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y \
    tar git curl wget dialog net-tools build-essential \
    zsh vim openssh-server supervisor \
    sudo screen htop \
    python3-dev python-virtualenv \
    nodejs \
    libcairo2-dev libjpeg8-dev libpango1.0-dev \
    libgif-dev build-essential g++

ADD /root /root
ADD /root /etc/skel
ADD /etc/supervisord.conf /etc/supervisor/conf.d/docker-ssh.conf
ADD /bin/docker-startup /usr/local/bin/docker-startup
RUN docker-startup
EXPOSE 22
EXPOSE 6543
CMD /usr/bin/supervisord
