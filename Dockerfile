FROM ubuntu:16.04
MAINTAINER toolbox@cloudpassage.com

ARG PY_VER=2.7.10

RUN mkdir /src/
WORKDIR /src/

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        openssl \
        python && \
    wget https://github.com/python/cpython/archive/v${PY_VER}.tar.gz && \
    tar -zxvf ./v${PY_VER}.tar.gz && \
    cd ./v${PY_VER} && \
    ./configure --prefix=/opt/python && \
    make && \
    make install && \
    apt-get remove -y \
        build-esssential \
        git && \
    apt-get autoremove -y && \
    rm -rf /src/*


WORKDIR /opt/python/bin

CMD /opt/bin/python/bin/python
