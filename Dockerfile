# Usage: sudo docker run --name monerod -v monero-blockchain:/root/.bitmonero -t r3lik/monero-full-node 
FROM ubuntu:16.04

LABEL description="Base image for Monero (XMR) fullnode and monero-wallet-cli"
LABEL maintainer="mike@r3lik.com"
LABEL version="2.0"

ENV MONERO_VERSION=0.12.2.0 MONERO_SHA256=cb97e3f8b700a81e1b0f1a77509eefbfb415aa6013f23685f8933b559309c580

# Get basic packages
RUN apt-get update && apt-get install -y curl vim bzip2 wget net-tools libpcsclite1

WORKDIR /root

RUN curl https://downloads.getmonero.org/cli/monero-linux-x64-v$MONERO_VERSION.tar.bz2 -O &&\
  echo "$MONERO_SHA256  monero-linux-x64-v$MONERO_VERSION.tar.bz2" | sha256sum -c - &&\
  tar -xjvf monero-linux-x64-v$MONERO_VERSION.tar.bz2 &&\
  rm monero-linux-x64-v$MONERO_VERSION.tar.bz2 &&\
  cp ./monero-v$MONERO_VERSION/monerod . &&\
  cp ./monero-v$MONERO_VERSION/monero-wallet-cli . &&\ 
  rm -r monero-*

# blockchain location - portable only 
VOLUME /root/.bitmonero

EXPOSE 18080 18081

ENTRYPOINT ["./monerod"]

# allow connections
#CMD ["--restricted-rpc", "--rpc-bind-ip=0.0.0.0", "--confirm-external-bind"]

#HEALTHCHECK --interval=5m --timeout=1m \
#    CMD curl -X POST http://127.0.0.1:18081/getheight -H 'Content-Type: application/json' || exit 1 

