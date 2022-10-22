FROM ubuntu
MAINTAINER Pterodactyl wine, <mclk623@163.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && \
apt-get install wget unzip lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 -y && \
wget https://cdn.azul.com/zulu/bin/zulu18.32.13-ca-jdk18.0.2.1-linux_amd64.deb && \
apt install ./zulu18.32.13-ca-jdk18.0.2.1-linux_amd64.deb -y && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
useradd -d /home/container -m container
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
USER container
ENV USER=container HOME=/home/container
ENV LANG C.UTF-8
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
