# https://hub.docker.com/_/alpine/tags
FROM alpine:3.23.2
LABEL org.opencontainers.image.description "Alpine based script runner container"
LABEL org.opencontainers.image.authors="marvkis"
LABEL org.opencontainers.image.source="https://github.com/marvkis/container-script-runner.git"
LABEL org.opencontainers.image.url="https://github.com/marvkis/container-script-runner"

# coreutils: delivers date command understanding `date -d '10 days ago 00:00:00'`
RUN apk --no-cache update && \
    apk --no-cache add bash curl coreutils rsync rclone s3cmd fuse3 restic kubectl btrfs-progs expect jq yq ;\
    rm -rf /var/cache/apk/*

USER root
WORKDIR /

# will be overwritten by container definition
ENTRYPOINT ["/bin/bash"]
CMD ["sleep","infinite"]
