#!/usr/bin/env bash

UBUNTU_REL_NAME="trusty"

# Install docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo deb https://apt.dockerproject.org/repo ubuntu-$UBUNTU_REL_NAME main > /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install -y -q \
  unzip \
  docker-engine

# let user vagrant run docker without sudo
usermod --append -G docker vagrant
service docker restart

