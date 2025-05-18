FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y 

RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    wget \
    gnupg2 \
    ca-certificates \
    lsb-release \
    sudo \
    software-properties-common \
    systemd \
    net-tools

RUN wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh && \
    chmod +x hst-install.sh

RUN bash hst-install.sh \
  --interactive no \
  --hostname hestia.example.com \
  --email admin@local.test \
  --username admin \
  --password admin123 \
  --lang en \
  --apache yes \
  --phpfpm yes \
  --multiphp no \
  --vsftpd yes \
  --proftpd no \
  --named yes \
  --mysql yes \
  --mysql8 no \
  --postgresql no \
  --exim yes \
  --dovecot yes \
  --sieve no \
  --clamav yes \
  --spamassassin yes \
  --iptables yes \
  --fail2ban yes \
  --quota no \
  --webterminal no \
  --api yes



EXPOSE 8083

CMD ["/sbin/init"]
