# Docker image with Ruby and fpm gem
FROM		ubuntu:16.04
MAINTAINER	Jakub Jarosz "jakub.jarosz@postpro.net"
LABEL Desscription="This image is used for building debian packages with fpm tool" Version="1.0"

ENV REFRESHED_AT 2016-05-02

RUN 	apt-get update && apt-get install -y \
  build-essential \
  ruby \
  ruby-dev \
  && gem install fpm \
  && apt-get autoremove -y

