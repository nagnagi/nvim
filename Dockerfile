FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
RUN tar -C /opt -xzf nvim-linux-x86_64.tar.gz
RUN rm nvim-linux-x86_64.tar.gz

RUN echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> /etc/bash.bashrc

