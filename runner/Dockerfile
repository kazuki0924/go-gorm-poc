FROM ubuntu:focal-20220801

# disable interactive dialogue
ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \
  && apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y \
    git \
    curl \
    wget \
    jq \
    bash \
    vim \
    zip \
    ripgrep \
    make \
    fd-find \
    fzf \
    postgresql \
    postgresql-contrib \
    cargo \
  && rm -rf /var/cache/apt

# fd
RUN ln -s "$(which fdfind)" /usr/local/bin/fd

# cargo
RUN echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc

# sd
RUN cargo install sd

# sops
ENV SOPS_VERSION v3.7.1
RUN wget -O /usr/local/bin/sops https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}-linux && chmod +x /usr/local/bin/sops

# yq
ENV YQ_VERSION 4.21.1
RUN wget https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_${YQ_VERSION}_linux_$(dpkg --print-architecture).tar.gz -O - | tar xz && mv yq_linux_$(dpkg --print-architecture) /usr/bin/yq

# dbmate
ENV DBMATE_VERSION 1.15
RUN curl -fsSL -o /usr/local/bin/dbmate https://github.com/amacneil/dbmate/releases/download/v${DBMATE_VERSION}/dbmate-linux-$(dpkg --print-architecture) && chmod +x /usr/local/bin/dbmate
