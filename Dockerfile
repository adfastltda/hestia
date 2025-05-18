# Instalar o HestiaCP com uma configuração mínima
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
