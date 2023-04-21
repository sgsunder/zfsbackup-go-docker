FROM golang:alpine AS builder
WORKDIR /go/src/app
ARG SOURCE_SHA1="7793275"
RUN wget -qO - "https://github.com/someone1/zfsbackup-go/tarball/${SOURCE_SHA1}" \
    | tar -xzvf - --strip-components=1
RUN go build

FROM alpine:latest
RUN apk --no-cache add zfs
COPY --from=builder /go/src/app/zfsbackup-go /usr/local/bin/zfsbackup-go
ENTRYPOINT [ "/usr/local/bin/zfsbackup-go" ]

ARG BUILD_DATE="Unknown"
LABEL \
    maintainer="" \
    org.opencontainers.image.title="ghcr.io/sgsunder/zfsbackup-go" \
    org.opencontainers.image.url="https://github.com/sgsunder/zfsbackup-go-docker" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.source="https://github.com/sgsunder/zfsbackup-go-docker" \
    org.opencontainers.image.licenses="MIT"
