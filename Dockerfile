FROM ubuntu:18.04

RUN set -ex ;\
    apt-get update ;\
    DEBIAN_FRONTEND=noninteractive apt-get install -y git-buildpackage libsqlite3-dev python ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*

RUN curl https://nodejs.org/dist/v12.19.0/node-v12.19.0-linux-x64.tar.xz | tar -C /usr/local -xJf -

ENV PATH=/usr/local/node-v12.19.0-linux-x64/bin:$PATH

RUN npm install -g node-gyp

RUN useradd -m build-user

USER build-user

WORKDIR /home/build-user

RUN git clone https://github.com/jasperapp/jasper

WORKDIR /home/build-user/jasper

RUN npm i
RUN npm run env:setup
RUN npm run linux:build

RUN set -ex ; \
    cd /home/build-user/jasper/out/linux ; \
    tar cpzf Jasper.tar.gz Jasper/
