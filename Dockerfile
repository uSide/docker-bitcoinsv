FROM debian:stable-slim

ENV BITCOINSV_VERSION=0.2.0
ENV BITCOINSV_CHECKSUM=e880d414b3dc355128788e9d70e0b16f9aace7cfb2a5766217969c79d4fad565

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinsv.io/bitcoinsv/${BITCOINSV_VERSION}/bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINSV_CHECKSUM} bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-sv-${BITCOINSV_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-sv-${BITCOINSV_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
