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

RUN bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
