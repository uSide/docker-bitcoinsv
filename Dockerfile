FROM debian:stable-slim

ENV BITCOINSV_VERSION=1.0.1
ENV BITCOINSV_CHECKSUM=8392c340b1fcc74ada9de72b16b5e026443c4b08757664b8133f447157b25a56

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinsv.io/bitcoinsv/${BITCOINSV_VERSION}/bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINSV_CHECKSUM} bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-sv-${BITCOINSV_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-sv-${BITCOINSV_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-sv-${BITCOINSV_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
