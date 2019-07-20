FROM debian:stable-slim

ENV BITCOINSV_VERSION=0.2.1
ENV BITCOINSV_CHECKSUM=ead4e26a516ff79be3615b165ceba41dc08c6c7656a0054b591d0c8085c6208c

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinsv.io/bitcoinsv/${BITCOINSV_VERSION}/bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINSV_CHECKSUM} bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-sv-${BITCOINSV_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-sv-${BITCOINSV_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
