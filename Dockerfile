FROM hyperledger/besu:22.1.1

WORKDIR /besu

USER root

RUN chown -R besu:besu /besu

USER besu

ADD --chown=besu *.json ./

VOLUME [ "/besu" ]
