#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM alpine

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'


RUN apk add --no-cache ca-certificates musl-locales musl-locales-lang openssl tzdata wget libstdc++

ENV JAVA_VERSION jdk-17.0.6.0.6+9

ARG EDITION=extended

RUN set -eux; \
    ARCH="$(apk --print-arch)"; \
    case "${ARCH}" in \
       amd64|x86_64) \
         if [ "${EDITION}" = "extended" ];then \
           ESUM='4620312ff9fa2772aed71315280af7c4c65cfa91e4a77bd47f6471ed279ed8a7'; \
           BINARY_URL='https://ghproxy.com/https://github.com/alibaba/dragonwell17/releases/download/dragonwell-17.0.3.0.3%2B7_jdk-17.0.3-ga/Alibaba_Dragonwell_17.0.3.0.3+7_x64_alpine-linux.tar.gz'; \
         else \
           ESUM='9d76324c8e66b01d48c11671ce14e86ddd8f513bf3e6a0e585705d40152918af'; \
           BINARY_URL='https://ghproxy.com/https://github.com/alibaba/dragonwell17/releases/download/dragonwell-standard-17.0.6.0.6%2B9_jdk-17.0.6-ga/Alibaba_Dragonwell_Standard_17.0.6.0.6.9_x64_alpine-linux.tar.gz'; \
         fi \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
	  wget -O /tmp/openjdk.tar.gz ${BINARY_URL}; \
	  echo "${ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
	  mkdir -p /opt/java/openjdk; \
	  tar --extract \
	      --file /tmp/openjdk.tar.gz \
	      --directory /opt/java/openjdk \
	      --strip-components 1 \
	      --no-same-owner \
	  ; \
    rm -rf /tmp/openjdk.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"

RUN echo Verifying install ... \
    && echo javac --version && javac --version \
    && echo java --version && java --version \
    && echo Complete.
    
RUN adduser -D -h /home/container container && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone && \
date -R
USER container
ENV USER=container HOME=/home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/sh", "/entrypoint.sh"]
