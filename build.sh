#!/bin/sh

set -eu

ICE_VERSION="$1"

build() {
    mkdir /tmp/$1
    cd /tmp/$1
    pip download "zeroc-ice==$ICE_VERSION"
    tar -zxf "zeroc-ice-$ICE_VERSION.tar.gz"
    cd "zeroc-ice-$ICE_VERSION"
    python setup.py bdist_wheel bdist_rpm
    cp dist/* /dist/
}

build py27
export PATH=/opt/rh/rh-python36/root/usr/bin/:$PATH
build py36
