FROM debian
MAINTAINER Pterodactyl wine, <mclk623@163.com>
RUN apt update -y && \
apt-get install wget unzip lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 -y && \
mkdir /usr/local/dragonwell17 && \
cd /usr/local/dragonwell17 && \
wget https://github.com/alibaba/dragonwell17/releases/download/dragonwell-17.0.3.0.3%2B7_jdk-17.0.3-ga/Alibaba_Dragonwell_17.0.3.0.3+7_x64_linux.tar.gz && \
tar -xzvf Alibaba_Dragonwell_17.0.3.0.3+7_x64_linux.tar.gz && \
rm Alibaba_Dragonwell_17.0.3.0.3+7_x64_linux.tar.gz && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
useradd -d /home/container -m container
USER container
ENV USER=container HOME=/home/container
ENV LANG C.UTF-8
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
