FROM alpine
MAINTAINER Shaun Einolf

LABEL \
  BASE_OS="Alpine Linux" \
  DEFAULT_IMAGE="alpine" \
  DEFAULT_TAG="congruencychecker" \
  DESCRIPTION="Deployment environment for drupal (based on CentOS 7)" \
  VERSION="1.0" \
  UID="Alpine1"

RUN apk update \ 
    && apk upgrade \
    && apk add \
    apache2 \
    git \
    nodejs \
    util-linux \
    supervisor

RUN npm install -g @angular/cli \
    && git config --global user.email "you@example.com" \ 
    && git config --global user.name "Your Name" 

ADD conf/httpd.conf /etc/apache2
ADD run.sh /usr/bin/
RUN chmod 777 /usr/bin/run.sh
RUN mkdir /run/apache2/

WORKDIR "/tmp"
RUN ng new cc

EXPOSE 80
ENTRYPOINT ["/usr/bin/run.sh"]
