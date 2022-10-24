FROM hyperledger/besu:22.10

WORKDIR /besu

USER root

RUN chown -R besu:besu /besu &&\
    apt update &&\
    apt upgrade -y

USER besu

ADD --chown=besu *.json ./

VOLUME [ "/besu" ]
