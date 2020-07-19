FROM docker:19.03.12

LABEL "com.github.actions.name"="Build"
LABEL "com.github.actions.description"="Build Docker image"
LABEL "com.github.actions.icon"="loader"
LABEL "com.github.actions.color"="white"

RUN set -eux && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
        bash \
        build-base \
        ca-certificates \
        curl \
        git \
        linux-headers

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
