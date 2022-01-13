Centos 7 Zeroc Ice Python 3 Builder
===================================

[![Actions Status](https://github.com/ome/zeroc-ice-py-centos7/workflows/Build/badge.svg)](https://github.com/ome/zeroc-ice-py-centos7/actions)

Builds Zeroc Ice wheel for CentOS 7 using SCL Python 3.8.

This can be used to create installable binary packages as an alternative to compiling from source using pip.

    docker build -t builder .
    docker run --rm -v $PWD/dist:/dist builder

To build a different version of IcePy:

    docker run --rm -v $PWD/dist:/dist builder /build.sh VERSION

Packages will be copied to `$PWD/dist`.
