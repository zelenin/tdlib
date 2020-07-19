FROM alpine:3.12.0 as builder

ENV LANG en_US.UTF-8

ARG TD_TAG

RUN apk upgrade --no-cache && \
    apk add --no-cache \
        build-base \
        ca-certificates \
        ccache \
        cmake \
        git \
        gperf \
        linux-headers \
        openssl-dev \
        php \
        php-ctype \
        readline-dev \
        zlib-dev && \
    git clone --depth 1 -b "${TD_TAG}" "https://github.com/tdlib/td.git" /src && \
    mkdir /src/build && \
    cd /src/build && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --target prepare_cross_compiling && \
    cd .. && \
    php SplitSource.php && \
    cd build && \
    cmake --build . --target install && \
    ls -lah /usr/local


FROM alpine:3.12.0

MAINTAINER Aleksandr Zelenin <aleksandr@zelenin.me>

ENV LANG en_US.UTF-8

RUN apk upgrade --no-cache

COPY --from=builder /usr/local/include/td /usr/local/include/td/
COPY --from=builder /usr/local/lib/libtd* /usr/local/lib/
