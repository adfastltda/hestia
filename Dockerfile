FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

# Dependências básicas
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

# Baixar o instalador
RUN wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh && \
    chmod +x hst-install.sh

# Instalar o HestiaCP com uma configuração mínima
RUN bash hst-install.sh \
    --interactive no \
    --hostname hestia.local \
    --email admin@local.test \
    --password admin123 \
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
    --lang en \
    --api yes

# Expõe a porta do painel (8083)
EXPOSE 8083

# Executar o systemd como PID 1
CMD ["/sbin/init"]
