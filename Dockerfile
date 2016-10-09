FROM ubuntu:16.04
MAINTAINER Eohyung Lee (liquidnuker@gmail.com)

RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
    build-essential python-pip software-properties-common \
    python-dev git

RUN echo "krb5-config krb5-config/default_realm string MYDOMAIN.COM" | debconf-set-selections && \
    echo "krb5-config krb5-config/kerberos_servers string krbserver.mydomain.com" | debconf-set-selections && \
    echo "krb5-config krb5-config/admin_server string krbserver.mydomain.com" | debconf-set-selections && \
    apt-get -y install libmysqlclient-dev libxml2-dev \
    libxslt1-dev mysql-client libpq-dev libvirt-dev \
    libnspr4-dev pkg-config libsqlite3-dev libzmq-dev \
    libffi-dev libldap2-dev libsasl2-dev ccache \
    krb5-config libkrb5-dev libssl-dev liberasurecode-dev \
    libjpeg8-dev curl

RUN pip install --upgrade pip && pip install tox
