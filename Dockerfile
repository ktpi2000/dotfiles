FROM ubuntu:latest

RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo

RUN apt update \
    && apt install -y \
    curl \
    git \
    vim \
    zsh

COPY .zshrc /root