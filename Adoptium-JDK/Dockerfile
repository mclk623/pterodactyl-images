FROM debian
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && \
apt-get install wget unzip lsof curl ca-certificates openssl git fontconfig tzdata locales -y && \
mkdir /usr/local/Adoptium-JDK && \
cd /usr/local/Adoptium-JDK && \
wget https://ghproxy.com/https://github.com/adoptium/temurin19-binaries/releases/download/jdk-19.0.2%2B7/OpenJDK19U-jdk_x64_linux_hotspot_19.0.2_7.tar.gz && \
tar -xzvf OpenJDK19U-jdk_x64_linux_hotspot_19.0.2_7.tar.gz && \
rm OpenJDK19U-jdk_x64_linux_hotspot_19.0.2_7.tar.gz && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
useradd -d /home/container -m container
USER container
ENV USER=container HOME=/home/container
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8 LANGUAGE=C.UTF-8
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
