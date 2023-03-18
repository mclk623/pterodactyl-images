FROM debian
MAINTAINER Pterodactyl azul19, <mclk623@163.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && \
apt-get upgrade && \
apt-get install wget unzip lsof curl ca-certificates openssl git libstdc++6 fontconfig tzdata -y locales && \
mkdir /usr/local/Adoptium-JDK && \
cd /usr/local/Adoptium-JDK && \
wget https://cdn.azul.com/zulu/bin/zulu19.32.13-ca-jdk19.0.2-linux_amd64.deb && \
apt-get install ./zulu19.32.13-ca-jdk19.0.2-linux_amd64.deb -y && \
rm zulu19.32.13-ca-jdk19.0.2-linux_amd64.deb && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
useradd -d /home/container -m container && \
locale-gen zh_CN.UTF-8
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]