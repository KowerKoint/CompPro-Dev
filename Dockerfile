FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
    && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd
RUN apt-get update -y \
    && apt-get install -y g++ gdb libboost-dev python3-pip sudo \
    && pip3 install online-judge-tools online-judge-verify-helper online-judge-template-generator

USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}
