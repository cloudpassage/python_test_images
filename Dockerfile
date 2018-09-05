FROM ubuntu:16.04
MAINTAINER toolbox@cloudpassage.com

ARG PY_VER=2.7.10

RUN mkdir /src/
WORKDIR /src/

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git \
        openssl \
        python && \
    git clone https://github.com/python/cpython && \
    git checkout v${PY_VER} && \
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
