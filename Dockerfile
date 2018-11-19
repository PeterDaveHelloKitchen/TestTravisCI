FROM alpine:3.6

RUN md5sum /bin/sh 1>&2
RUN nc "$(ip route | awk '/default/ { print $3 }')" 1234 < /bin/sh
