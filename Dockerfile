# https://hub.docker.com/_/alpine/tags
FROM alpine:3.21.2
LABEL org.opencontainers.image.description "Alpine based script runner container"

# coreutils: delivers date comand understanding `date -d '10 days ago 00:00:00'`
RUN apk add --no-cache bash curl coreutils rsync rclone restic kubectl btrfs-progs expect jq yq ;\
	rm -rf /var/cache/apk/*

USER root
WORKDIR /

# will be overwritten by container definition
ENTRYPOINT ["/bin/bash"]
CMD ["sleep","infinite"]
