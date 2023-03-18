FROM debian
MAINTAINER Pterodactyl azul19, <mclk623@163.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://deb.debian.org#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list && \
sed -i 's|security.debian.org/debian-security|mirrors.tuna.tsinghua.edu.cn/debian-security|g' /etc/apt/sources.list && \
apt update -y && \
apt-get upgrade && \
apt-get install wget unzip lsof curl apt-transport-https ca-certificates openssl git libstdc++6 fontconfig tzdata -y locales && \
sed -i 's#http://mirrors.tuna.tsinghua.edu.cn#https://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list && \
mkdir /usr/local/azul && \
cd /usr/local/azul
wget https://cdn.azul.com/zulu/bin/zulu19.32.13-ca-jdk19.0.2-linux_amd64.deb && \
apt-get install /usr/local/azul/zulu19.32.13-ca-jdk19.0.2-linux_amd64.deb -y && \
rm /usr/local/azul/zulu19.32.13-ca-jdk19.0.2-linux_amd64.deb && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
useradd -d /home/container -m container && \
locale-gen zh_CN.UTF-8
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
