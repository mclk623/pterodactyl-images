FROM debian
ARG DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8 LANGUAGE=C.UTF-8
RUN apt update -y && \
apt-get install lsof wget curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 locales -y && \
wget -O /tmp/openjdk.tar.gz https://cdn.azul.com/zing-zvm/ZVM23.06.0.0/zing23.06.0.0-2-jdk17.0.7-linux_x64.tar.gz && \
	  mkdir -p /opt/java/openjdk && \
	  tar -xvf /tmp/openjdk.tar.gz -C /opt/java/openjdk/ && \
	  ls /opt/java/openjdk/ && \
       rm -rf /tmp/openjdk.tar.gz

ENV JAVA_HOME=/opt/java/openjdk/zing23.06.0.0-2-jdk17.0.7-linux_x64 \
    PATH="/opt/java/openjdk/zing23.06.0.0-2-jdk17.0.7-linux_x64/bin:$PATH"

RUN echo Verifying install ... \
    && echo java --version && java --version \
    && echo Complete.
    
RUN adduser -D -h /home/container container && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone && \
date -R

USER container
ENV USER=container HOME=/home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
