# build-jasperapp-ubuntu-18.04

build https://github.com/jasperapp/jasper for ubuntu 18.04

## motivation
official jasper linux binary was not built for ubuntu 18.04

that requires GLIBC_2.29, but only have 2.27

## prerequires
docker

## how to build

```
git clone https://github.com/woremacx/build-jasperapp-ubuntu-18.04
cd build-jasperapp-ubuntu-18.04
./build-and-extract.sh

# you will have Jasper.tar.gz
```
