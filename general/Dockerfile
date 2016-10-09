FROM leoh0/tox-openstack-base:latest

WORKDIR /app

ARG GITBRANCH=stable/mitaka

ARG GITREPO=github.com

ARG PROJECT

ENV UPPER_CONSTRAINTS_FILE=/upper-constraints.txt

RUN mkdir -p /temp/ && \
    git clone -b $GITBRANCH https://$GITREPO/openstack/requirements.git /temp/ && \
    mv /temp/upper-constraints.txt ../ && \
    rm -rf /temp/

RUN git clone -b $GITBRANCH https://$GITREPO/openstack/$PROJECT.git /app/

RUN tox -e py27 --notest

RUN mv /app/.tox /.tox && rm -rf /app && mkdir -p /app

ONBUILD COPY . /app

ONBUILD RUN ln -s ../.tox .
