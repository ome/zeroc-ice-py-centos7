FROM centos:7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN curl -sL https://zeroc.com/download/Ice/3.6/el7/zeroc-ice3.6.repo > \
    /etc/yum.repos.d/zeroc-ice3.6.repo
RUN yum install -y centos-release-scl && \
    yum install -y -q epel-release && \
    yum install -y -q \
        ice-all-runtime \
        ice-all-devel \
        bzip2-devel \
        expat-devel \
        gcc \
        gcc-c++ \
        libdb-utils \
        openssl-devel \
        python-devel \
        python-pip \
        rh-python36 \
        rh-python36-python-devel \
        rpm-build
RUN pip install wheel
RUN /opt/rh/rh-python36/root/usr/bin/pip install wheel
RUN mkdir /dist
ADD build.sh /
CMD ["/build.sh", "3.6.4"]
