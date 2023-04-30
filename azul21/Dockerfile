FROM alpine

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'


RUN apk add --no-cache ca-certificates musl-locales musl-locales-lang openssl tzdata wget libstdc++


ARG EDITION=extended

RUN set -eux; \
    ARCH="$(apk --print-arch)"; \
    case "${ARCH}" in \
       amd64|x86_64) \
         if [ "${EDITION}" = "extended" ];then \
           BINARY_URL='https://cdn.azul.com/zulu/bin/zulu21.0.53-ea-jdk21.0.0-ea.20-linux_musl_x64.tar.gz'; \
         fi \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
	  wget -O /tmp/openjdk.tar.gz ${BINARY_URL}; \
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
