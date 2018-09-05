FROM ubuntu:16.04
MAINTAINER toolbox@cloudpassage.com

ARG PY_VER=2.7.10

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    git \
    openssl \
    python

RUN mkdir /src/
WORKDIR /src/

RUN git clone https://github.com/python/cpython

WORKDIR /src/cpython

RUN git checkout v${PY_VER}

RUN ./configure --prefix=/opt/python && \
    make && \
    make install
