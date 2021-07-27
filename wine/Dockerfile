FROM ubuntu:20.10
MAINTAINER Pterodactyl wine, <mclk623@163.com>
RUN apt update -y && \
apt-get install wget unzip p7zip-full software-properties-common -y && \
cd && \
add-apt-repository ppa:cybermax-dexter/sdl2-backport && \
apt-get install libfaudio0 -y && \
sed -i s/bionic/eoan/g /etc/apt/sources.list && \
dpkg --add-architecture i386 && \
wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
apt-key add winehq.key && \
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ groovy main' && \
apt update && \
apt-get install winehq-stable -y && \
wine --version && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
wget -O /usr/local/bin/winetricks http://ys-c.ys168.com/614099122/n524K7G265NTKSLuKRT/winetricks && \
chmod 755 /usr/local/bin/winetricks && \
winetricks fakechinese && \
winetricks wenquanyi && \
winetricks corefonts

RUN useradd container
USER container
ENV USER=container HOME=/home/container
ENV LANG zh_CN.UTF-8
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]



