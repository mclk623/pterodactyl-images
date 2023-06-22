FROM ubuntu:20.04
MAINTAINER Pterodactyl wine, <mclk623@163.com>
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8 LANGUAGE=C.UTF-8
RUN apt update -y && \
apt-get install lsof wget curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 locales -y && \
sudo dpkg --add-architecture i386 && \
wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
COPY ./winehq.list /etc/apt/sources.list.d/winehq.list
RUN sudo apt update && \
sudo apt install --install-recommends winehq-stable &&\
wine --version
RUN adduser -D -h /home/container container && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone && \
date -R
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]



