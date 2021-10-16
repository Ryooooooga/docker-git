FROM ubuntu:20.04 AS builder

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    curl \
    libcurl4-gnutls-dev \
    libexpat1-dev \
    libssl-dev \
    libz-dev

ARG GIT_VERSION
WORKDIR /git

RUN curl -sL "https://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.xz" -o - | tar xvJ \
    && cd "git-${GIT_VERSION}" \
    && ./configure \
    && make -j8 git \
    && mv git /usr/local/bin/

FROM ubuntu:20.04

RUN apt-get update && apt-get install --no-install-recommends -y \
    openssl

COPY --from=builder /usr/local/bin/git /usr/local/bin/

ENTRYPOINT [ "git" ]
