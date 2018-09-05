FROM ubuntu:16.04
MAINTAINER toolbox@cloudpassage.com

ARG PY_VER=2.7.10

RUN mkdir /src/
WORKDIR /src/

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        libssl-dev \
        python \
        wget \
        zlib1g-dev && \
    wget https://github.com/python/cpython/archive/v${PY_VER}.tar.gz && \
    tar -zxvf ./v${PY_VER}.tar.gz && \
    cd ./cpython-${PY_VER} && \
    ./configure --prefix=/opt/python && \
    make && \
    make install && \
    apt-get remove -y \
        build-essential \
        git && \
    apt-get autoremove -y && \
    rm -rf /src/*


WORKDIR /opt/python/bin

# Because Py3.
RUN /opt/python/bin/python || ln -s /opt/python/bin/python3 /opt/python/bin/python

# Check to make sure we can use pip
RUN /opt/python/bin/python -mpip search numpy

CMD /opt/bin/python/bin/python
