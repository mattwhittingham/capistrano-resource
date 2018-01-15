FROM alpine:3.6

MAINTAINER Patrick Pokatilo <docker-hub@shyxormz.net>

RUN apk update && apk add \
  git \
  openssh \
  ruby \
  ruby-io-console \
  ruby-json \
  && gem install --no-rdoc --no-ri bundler -v 1.15.1 \
  && mkdir -pv ~/.ssh \
  && echo -ne "StrictHostKeyChecking no\nLogLevel quiet\n" > ~/.ssh/config \
  && chmod 0600 ~/.ssh/config

COPY check in out /opt/resource/
