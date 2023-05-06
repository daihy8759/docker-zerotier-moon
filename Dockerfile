ARG ALPINE_VERSION=3.17

FROM alpine:${ALPINE_VERSION}

ARG ZT_VERSION=1.10.2-r0

LABEL maintainer="seedgou <seedgou@gmail.com>"

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.17/main" > /etc/apk/repositories \
&& echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.17/community" >> /etc/apk/repositories \
&& echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.17/testing" >> /etc/apk/repositories \
&& apk add --no-cache zerotier-one=${ZT_VERSION}

COPY startup.sh /startup.sh
EXPOSE 9993/udp

ENTRYPOINT ["/startup.sh"]
