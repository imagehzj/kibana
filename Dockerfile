FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"

WORKDIR /opt/sh

ARG version=7.14.0

RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-$version-linux-x86_64.tar.gz && \
mkdir /opt/sh/kibana && \
tar -xf kibana-$version-linux-x86_64.tar.gz -C /opt/sh/kibana --strip-components 1 && \
rm -rf kibana-$version-linux-x86_64.tar.gz && \
chown -R sh:sh /opt/sh

WORKDIR /opt/sh/kibana