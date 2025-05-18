FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
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
    --hostname hestia.local \
    --email admin@local.test \
    --username admin \
    --password admin123 \
    --lang en \
    --apache no \
    --named no \
    --clamav no \
    --spamassassin no \
    --multiphp no \
    --vsftpd no \
    --proftpd no \
    --postgresql no \
    --sieve no \
    --quota no \
    --webterminal no \
    --api yes

EXPOSE 8083

CMD ["/sbin/init"]
