FROM debian:stable-slim

ENV BITCOINSV_VERSION=1.0.2
ENV BITCOINSV_CHECKSUM=4f777d47c136194f0076a54b2241d41fc719d2e8739de559c7bf568e22a0b254

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinsv.io/bitcoinsv/${BITCOINSV_VERSION}/bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINSV_CHECKSUM} bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-sv-${BITCOINSV_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-sv-${BITCOINSV_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
