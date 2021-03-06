FROM ttbb/base

LABEL maintainer="shoothzj@gmail.com"

WORKDIR /opt/sh

ARG TARGETARCH

ARG amd_download=7.16.0-linux-x86_64

ARG arm_download=7.16.0-linux-aarch64

RUN if [[ "$TARGETARCH" = "amd64" ]]; \
    then download=$amd_download; \
    else download=$arm_download; \
    fi && \
    wget https://artifacts.elastic.co/downloads/kibana/kibana-$download.tar.gz && \
    mkdir /opt/sh/kibana && \
    tar -xf kibana-$download.tar.gz -C /opt/sh/kibana --strip-components 1 && \
    rm -rf kibana-$download.tar.gz && \
    chown -R sh:sh /opt/sh

WORKDIR /opt/sh/kibana