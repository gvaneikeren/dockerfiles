# Compile of registry binaries
FROM resin/rpi-raspbian:stretch as builder

ENV DISTRIBUTION_DIR /go/src/github.com/docker/distribution
ENV DOCKER_BUILDTAGS include_oss include_gcs

RUN apt-get update && \
    apt-get install --assume-yes make git

ARG VERSION=master
RUN git clone -b $VERSION https://github.com/docker/distribution.git $DISTRIBUTION_DIR

WORKDIR $DISTRIBUTION_DIR
RUN mkdir -p /etc/docker/registry && \
    cp cmd/registry/config-dev.yml /etc/docker/registry/config.yml

RUN make PREFIX=/go clean binaries


# Build a minimal distribution container
FROM resin/rpi-raspbian:stretch

RUN apt-get update && \
    apt-get install -y ca-certificates librados2 apache2-utils && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /go/bin/registry /bin/registry
COPY --from=builder /go/src/github.com/docker/distribution/cmd/registry/config-example.yml /etc/docker/registry/config.yml

VOLUME ["/var/lib/registry"]
EXPOSE 5000
ENTRYPOINT ["/bin/registry"]
CMD ["serve", "/etc/docker/registry/config.yml"]
