FROM golang:1.12.5-alpine3.9 as builder
RUN apk add --no-cache git
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go get -u github.com/ginuerzh/gost/cmd/gost
FROM alpine:3.9
WORKDIR /usr/bin/
COPY --from=builder /go/bin/gost .
COPY gost.json /tmp
COPY init.sh /
RUN chmod +x /init.sh
CMD ["/init.sh"]
EXPOSE 1080
VOLUME /etc/config
