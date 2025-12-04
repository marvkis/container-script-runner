# https://hub.docker.com/_/alpine/tags
FROM alpine:3.23.0
LABEL org.opencontainers.image.description "Alpine based script runner container"

# coreutils: delivers date comand understanding `date -d '10 days ago 00:00:00'`
RUN apk --no-cache update && \
    apk --no-cache add bash curl coreutils rsync rclone fuse3 restic kubectl btrfs-progs expect jq yq ;\
    rm -rf /var/cache/apk/*

USER root
WORKDIR /

# will be overwritten by container definition
ENTRYPOINT ["/bin/bash"]
CMD ["sleep","infinite"]
