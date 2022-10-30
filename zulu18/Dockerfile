FROM mclk623/pterodactyl-images:ubuntu-bse-tzdata
MAINTAINER Pterodactyl wine, <mclk623@163.com>
RUN apt update -y && \
apt-get install wget lsof curl ca-certificates openssl tar fontconfig libfreetype6 locales -y && \
apt-get upgrade -y && \
wget https://cdn.azul.com/zulu/bin/zulu18.32.13-ca-jdk18.0.2.1-linux_amd64.deb && \
apt install ./zulu18.32.13-ca-jdk18.0.2.1-linux_amd64.deb -y && \
rm -fr zulu18.32.13-ca-jdk18.0.2.1-linux_amd64.deb && \
locale-gen zh_CN.UTF-8 && \
useradd -d /home/container -m container
RUN date
USER container
ENV USER=container HOME=/home/container
ENV LC_ALL=zh_CN.UTF-8
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN.UTF-8
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
