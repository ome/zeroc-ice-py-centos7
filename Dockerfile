FROM centos:7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

ENV PATH /opt/rh/rh-python38/root/usr/bin:$PATH
ARG PATH /opt/rh/rh-python38/root/usr/bin:$PATH

RUN curl -sL https://zeroc.com/download/Ice/3.6/el7/zeroc-ice3.6.repo > \
    /etc/yum.repos.d/zeroc-ice3.6.repo
RUN yum install -y -q epel-release && \
    yum install -y \
        ice-all-runtime \
        ice-all-devel \
        bzip2-devel \
        expat-devel \
        gcc \
        gcc-c++ \
        libdb-utils \
        openssl-devel

RUN yum install -y centos-release-scl
RUN  yum install -y rh-python38-python \
    rh-python38-python-devel \
    rh-python38-python-wheel

RUN source /opt/rh/rh-python38/enable
RUN mkdir /dist
ADD build.sh /
CMD ["/build.sh", "3.6.5"]
